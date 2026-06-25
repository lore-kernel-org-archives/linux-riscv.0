Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FA7CDE005
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 01:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Qujn6F7WPTx37dOtHodffQJJ0Bpo4yGSqtmD4SCxos=; b=TC42nNdrJSy0yA
	WuhMIbsKbc5LSCboXuJ1ohpwM06XspJW4vfWEEERjO6iNt3RS7KZUOg/6qy9UX8/XER7jz1oShble
	j4WUc+3Wk0jc14/qik4Xu930rId5rWNoG/9DMJ3aCtyDp7haOM4RzM3DNEU+QCoM9hccA1KnnEAyP
	4mmwFsqKAdeVIgJFHMgXjoigs5b2CDHGlxpGsTeiqJoxLz8RzvBI4ICd2P4pKNAQwY4wxxTWQ4qBK
	Fz41qG2X4RKyH1OZuE0jUKvCo8ChzkAVUfoOklIcLL4C16Q0IYV9ORITvmbavIPfIQo3A+pRA1tgP
	gQznnV790hRdOA2rapgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZ5G-00000008WMN-1ldz;
	Thu, 25 Jun 2026 01:40:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZ5D-00000008WL0-2Eb7
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 01:40:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 430476021D;
	Thu, 25 Jun 2026 01:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C831F00ADB;
	Thu, 25 Jun 2026 01:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782351646;
	bh=P7Fx5JxHcGHBnFRKWSclF7q97XV2lAuqKNGJj7WnUNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HDWOSHthHBds1VCbCcStWcybX0c43Mi3G/hDOuovnSnaX/QKUfIfuCGPi02ButVJ4
	 dUMCeEQFlEzb1xlGnNeNC/wxN0N89PFBcSzPis9pNhJkGGgzLqP1nNcstxCOocwZQv
	 CJTjRGELLFRF7beR+h7JDRaogzXfwWWVZB/sG0r19OVIcRnru6Pl7TpnJEZ8AySRKS
	 vJ7oGrsKrMi7Aoxooi8q98TgkqghqKYSbCZthi6aM+IWpa5pkws17jOT2cQHU0tSER
	 9LxsxD4DlszETUhULK4Zh0K3eNz6kOnIqXKmO0h1MxES+7Bz9Ugf9mHxOOvoOvKHqQ
	 RXgF29FO/zIDA==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 24 Jun 2026 18:38:30 -0700
Subject: [PATCH v2 2/8] riscv: Detect the Ssqosid extension
MIME-Version: 1.0
Message-Id: <20260624-dfustini-atl-sc-cbqri-dt-v2-2-2f8049fd902b@kernel.org>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
In-Reply-To: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749; i=fustini@kernel.org;
 h=from:subject:message-id; bh=x9zob8Q+My3JqC1K8N4GCfe7DNcEjyxyU00/yAg+r/U=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMWTZtEt553RHh3wKtsnhjm1OO5Q6y25aXWld5t9J/8z3T
 PTwOn2xo5SFQYyDQVZMkWXTh7wLS7xCvy6Y/2IbzBxWJpAhDFycAjCR9n8M/0zCnV4+ufQ1x1Jd
 /rDe1a+HFnlLLzZ0DJF3LPD0CH7hsZCR4WPFJtOODp0dbcH+0/neCZ5rlTnJrmCyT2C+cMoDucB
 kLgA=
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U3Nxb3NpZCBpcyB0aGUgUklTQy1WIFF1YWxpdHktb2YtU2VydmljZSAoUW9TKSBJZGVudGlmaWVy
cyBzcGVjaWZpY2F0aW9uCndoaWNoIGRlZmluZXMgdGhlIFN1cGVydmlzb3IgUmVzb3VyY2UgTWFu
YWdlbWVudCBDb25maWd1cmF0aW9uIChzcm1jZmcpCnJlZ2lzdGVyLgoKTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2L3Jpc2N2LXNzcW9zaWQvcmVsZWFzZXMvdGFnL3YxLjAKQ28tZGV2ZWxv
cGVkLWJ5OiBLb3JuZWwgRHVsxJliYSA8bWluZGFsQHNlbWloYWxmLmNvbT4KU2lnbmVkLW9mZi1i
eTogS29ybmVsIER1bMSZYmEgPG1pbmRhbEBzZW1paGFsZi5jb20+ClNpZ25lZC1vZmYtYnk6IERy
ZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdjYXAuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRl
eCA3ZWY4ZTVmNTVjOGRjZjI2ZTNkY2M2NzZkYjMyYzJmMTZiN2U3ZjVhLi5iODNkYWU1Y2ViYjk5
MjY5OTAyMjc5ZmFhM2MwM2ZkMjNmN2Q0MzQyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC0x
MTIsNiArMTEyLDcgQEAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0xTRAkJMTAzCiAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWklDRklMUAkJMTA0CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklDRklT
UwkJMTA1CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1NRT1NJRAkJMTA2CiAKICNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcJMTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCBm
NDZhYTU2MDJkNzRkMzMyMjk2MDU1OWZiNzNiYjUwMTUyOTA5MzQ0Li42NjhhN2U3MWZmMWM2NGU4
YmQzNmJhNmVhOTRmOGE1ZGQ0NjAwMDE2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC01ODIs
NiArNTgyLDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0
W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3NhaWEsIFJJU0NWX0lTQV9FWFRfU1NBSUEp
LAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzY29mcG1mLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1G
KSwKIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoc3NucG0sIFJJU0NWX0lTQV9FWFRfU1NOUE0s
IHJpc2N2X3hsaW51eGVudmNmZ19leHRzKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQShzc3Fvc2lk
LCBSSVNDVl9JU0FfRVhUX1NTUU9TSUQpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzdGMsIFJJ
U0NWX0lTQV9FWFRfU1NUQyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3ZhZGUsIFJJU0NWX0lT
QV9FWFRfU1ZBREUpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHN2YWR1LCBSSVND
Vl9JU0FfRVhUX1NWQURVLCByaXNjdl9leHRfc3ZhZHVfdmFsaWRhdGUpLAoKLS0gCjIuMzQuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
