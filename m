Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839ADC54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiGslsSeqqoRFfJCmcNcxqtdGYbUw4juW+q/2sdW+1Y=; b=C9VrxtCah8OeUo
	icUhO6zaCriFtBvgcrROgjzOppp+DCTp3bGcba64XF5cd8hBdHz+l6ijM+Vu9R6wgBQN2ftdnin58
	BDQxk3j87sVcxLvBxDuCXFaZFzSMrTj5CQGScRFB85wolbeCzkPsV4KeL/mBOr6pYT+bS6QqUlUKV
	JWWED6GGheLROE8jvu6Y977LuXPnXMKkgs4NAz6NHpkESYu8w1LXNET0T2PCvVTlN1NMH0jHsmoTW
	NtFBCzlAQSOqU95Qujx6eVUcetJnmV1ichn6ozkGuIh0dlcVC7nN/I1xOoRokMINdUjsBZ+oSY8jl
	CLV43ddmiIkHWC+HlX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhY5R-0000000Ea8q-0LYU;
	Tue, 05 Mar 2024 16:56:17 +0000
Received: from out203-205-221-233.mail.qq.com ([203.205.221.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhY5M-0000000Ea54-14Tl
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 16:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709657766; bh=qBC2AcX0mTtuXWYOBTP2x46Bkvdu0LNhIGH61FR39Gk=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=MIYQIVo/5RJr57Cdrc2jPb/DOeHLzBDfGGc/T9zOmQ6T+rkvtMTQcorNqy58WGZqp
	 2sxWYgRCXoAmGmN9AgU03lgUioqKW3l+oucEcGGttQi4DFS17T89J87bsmrc/QAaqA
	 I0iEZZdCq55RwWUonSTp+TpzTzvj1Cb3Q/168nnQ=
Received: from smtpclient.apple ([2001:da8:c800:d084:84f7:c158:bab8:8899])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id E0297E41; Wed, 06 Mar 2024 00:56:02 +0800
X-QQ-mid: xmsmtpt1709657762tosh5bdf9
Message-ID: <tencent_E7385EE2AEC4B486DC343AF1A108DE68370A@qq.com>
X-QQ-XMAILINFO: MZtEYADUG4Ag7e/E7T3snRGQVxKSEkcuqqMQynq/q/5fu+wxuD5INq9X5LMOD/
	 iOisb1ByHIywnJVC+Kd0b1r0O3TmDy5XAKC1hxXJpkev9Hz0/9xvjw/fa5MvsyTwUdosdMvgD8Pk
	 H8CaGnw3HKWsFBBNyPVBsWhGhLtsUwm/y3MNvJTDgRhSpCQ4iA8oZcOHKLydxbvZn0m2nDuZlLG7
	 +ybxh4PLRTt65ZmIEschfVgPGHS+AXlfRQTURLoHjyYFrNJBaG6UvCnTfhMtvuSnQ5oxlrpl/Fkh
	 kEZgOUhIkRtx5OskbW+gS0PaEoqu57r/ATPdmXvH9wvwJVpFCvg/hmEZxil1ZLE7yOioE482yQJR
	 0Fl03kFshp9mdC3+3HTxHF1CJzIJ30E1I8lMqSRqCRzoOXGv8OrKBmEEEKI8E7Acy6KGro6FCiRU
	 +o8h8NXAxoxD0syf5//co/SaR57WTem2tpL+XbFemL3vmnMS/bQN2Dvr568ttoUfJPHOrzdLFDfS
	 tDGA680R1dhH2tcgFHCLzOhdT8MJCQeXfChh8U1woQDhtRMWi7zCqSSrimxa8hcmVyQnwdOFp3Ac
	 ocn1XwUbxidrKz7KUQPIzKLD3l7Zh9XPjXwrNxoO+xDfjwsV7zU/o8p1Ue+GWlrLtF9eA0/HXpDJ
	 e43NQ2FI1nCqAhYrcKkrN+/4G5+ocQ/WzbIV6qawCSOMBA/T3DIwscg3wtLSCCTs826onoRK4Q/m
	 d15E53lYgJSbzkGif/+uUeN6C47MA3U52YTZjbr29q1iouLNv04nDl/HwZhx5LvQVUTARPDIECjC
	 +FepNu2qUmpPLT3/oJO0IT6P0fxvpvBBeCDRl8Cy3ViFoBcCbK8sqHmqmaBReJYv+lhk+d7zlgoC
	 armUzv3XqR2zLgEFK/2QoQuGwHpI3MwUdcYUELLNXN9dffza8+zcPp3x5uFt9p328goYhjzsjS+p
	 d46b8vVzAHdIH5yAMHlpfY32k/OGrJ/9CzkcuIRoGl3IK5l/gqx5I32+labTqX5uLPGXiCZFVAKN
	 Cc4za/kQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v3 7/7] riscv: config: enable SOC_CANAAN in defconfig
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <2a206c9b-b570-4081-b4e4-d177343482f3@kernel.org>
Date: Wed, 6 Mar 2024 00:55:52 +0800
Cc: linux-riscv@lists.infradead.org,
 Conor Dooley <conor@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
X-OQ-MSGID: <0350242B-6F2F-4741-A936-5E578F86924B@cyyself.name>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_E2812086B695A334EE5E8C70C85CA3171F06@qq.com>
 <2a206c9b-b570-4081-b4e4-d177343482f3@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_085612_678114_43742F7B 
X-CRM114-Status: GOOD (  14.18  )
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

Cgo+IE9uIE1hciA1LCAyMDI0LCBhdCAwNzo1MCwgRGFtaWVuIExlIE1vYWwgPGRsZW1vYWxAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gCj4gT24gMy81LzI0IDA2OjA2LCBZYW5neXUgQ2hlbiB3cm90ZToK
Pj4gU2luY2UgSzIzMCBoYXMgYmVlbiBzdXBwb3J0ZWQsIGFsbG93IFNPQ19DQU5BQU4gdG8gYmUg
c2VsZWN0ZWQgdG8gYnVpbGQgZHQKPj4gYW5kIGRyaXZlcnMgZm9yIGl0IGluIGRlZmNvbmZpZy4K
Pj4gCj4+IFNpZ25lZC1vZmYtYnk6IFlhbmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgo+PiBS
ZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4g
LS0tCj4+IGFyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcgfCAxICsKPj4gMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25maWdz
L2RlZmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPj4gaW5kZXggODlhMDA5
YTU4MGZlLi4yMGI1NTdlYzI4ZGYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvY29uZmlncy9k
ZWZjb25maWcKPj4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+PiBAQCAtMzMs
NiArMzMsNyBAQCBDT05GSUdfU09DX1NUQVJGSVZFPXkKPj4gQ09ORklHX0FSQ0hfU1VOWEk9eQo+
PiBDT05GSUdfQVJDSF9USEVBRD15Cj4+IENPTkZJR19TT0NfVklSVD15Cj4+ICtDT05GSUdfU09D
X0NBTkFBTj15Cj4gCj4gR2l2ZW4gdGhhdCB0aGUgazIxMCBuZWVkICFNTVUsIGluY2x1ZGluZyBp
dCBsaWtlIHRoaXMgaW4gdGhlIGRlZmNvbmZpZyBpcwo+IG9kZC4uLiBJIGRvIG5vdCBldmVuIHNl
ZSBob3cgdGhhdCBjb3VsZCB3b3JrLiBCdXQgdGhhdCBkZXBlbmRzIG9uIHBhdGNoIDUsCj4gd2hp
Y2ggZG9lcyBub3Qgc2VlbSBPSyB0byBtZS4KPiAKCkkgZG9u4oCZdCBrbm93IHdoeSDigJxub3Qg
c2VlbSBPS+KAnSBoZXJlLgoKSSB3aWxsIHNob3cgdGhlIGNvbnNvbGUgdG8gdGVsbCB5b3Ugd2hh
dCBjaGFuZ2VzIGluIGRlZmNvbmZpZzoKCmBgYGNvbnNvbGUKJCAgbGludXggZ2l0Oihydl9idWls
dGluX2R0Yl92MykgbWFrZSBBUkNIPXJpc2N2IENST1NTX0NPTVBJTEU9cmlzY3Y2NC1saW51eC1n
bnUtIGRlZmNvbmZpZwoqKiogRGVmYXVsdCBjb25maWd1cmF0aW9uIGlzIGJhc2VkIG9uICdkZWZj
b25maWcnCiMKIyBjb25maWd1cmF0aW9uIHdyaXR0ZW4gdG8gLmNvbmZpZwojCiQgIGxpbnV4IGdp
dDoocnZfYnVpbHRpbl9kdGJfdjMpIGNwIC5jb25maWcgLmNvbmZpZy5iYWsKJCAgbGludXggZ2l0
Oihydl9idWlsdGluX2R0Yl92MykgZ2l0IGNoZWNrb3V0IGsyMzBfZHRfaW5pdGlhbF92MwpTd2l0
Y2hlZCB0byBicmFuY2ggJ2syMzBfZHRfaW5pdGlhbF92MycKJCAgbGludXggZ2l0OihrMjMwX2R0
X2luaXRpYWxfdjMpIG1ha2UgQVJDSD1yaXNjdiBDUk9TU19DT01QSUxFPXJpc2N2NjQtbGludXgt
Z251LSBkZWZjb25maWcKKioqIERlZmF1bHQgY29uZmlndXJhdGlvbiBpcyBiYXNlZCBvbiAnZGVm
Y29uZmlnJwojCiMgY29uZmlndXJhdGlvbiB3cml0dGVuIHRvIC5jb25maWcKIwokICBsaW51eCBn
aXQ6KGsyMzBfZHRfaW5pdGlhbF92MykgZGlmZiAuY29uZmlnIC5jb25maWcuYmFrCjMwMSwzMDJk
MzAwCjwgQ09ORklHX0FSQ0hfQ0FOQUFOPXkKPCBDT05GSUdfU09DX0NBTkFBTj15CjI2NzhkMjY3
NQo8IENPTkZJR19QSU5DVFJMX0syMTA9eQo0NjIxZDQ2MTcKPCBDT05GSUdfQ09NTU9OX0NMS19L
MjEwPXkKNDwKNzA2LDQ3MDdkNDcwMQo8IENPTkZJR19TT0NfSzIxMF9TWVNDVEw9eQo1MzM0ZDUz
MjcKPCBDT05GSUdfQVJDSF9IQVNfUkVTRVRfQ09OVFJPTExFUj15CjUzMzZkNTMyOAo8IENPTkZJ
R19SRVNFVF9LMjEwPXkKJCAgbGludXggZ2l0OihrMjMwX2R0X2luaXRpYWxfdjMpIGdyZXAgLXIg
IkNPTkZJR19BUkNIX0hBU19SRVNFVF9DT05UUk9MTEVSIgprZXJuZWwvY29uZmlnX2RhdGE6Q09O
RklHX0FSQ0hfSEFTX1JFU0VUX0NPTlRST0xMRVI9eQppbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmY6
Q09ORklHX0FSQ0hfSEFTX1JFU0VUX0NPTlRST0xMRVI9eQppbmNsdWRlL2dlbmVyYXRlZC9hdXRv
Y29uZi5oOiNkZWZpbmUgQ09ORklHX0FSQ0hfSEFTX1JFU0VUX0NPTlRST0xMRVIgMQppbmNsdWRl
L2dlbmVyYXRlZC9ydXN0Y19jZmc6LS1jZmc9Q09ORklHX0FSQ0hfSEFTX1JFU0VUX0NPTlRST0xM
RVIKaW5jbHVkZS9nZW5lcmF0ZWQvcnVzdGNfY2ZnOi0tY2ZnPUNPTkZJR19BUkNIX0hBU19SRVNF
VF9DT05UUk9MTEVSPSJ5IgouY29uZmlnOkNPTkZJR19BUkNIX0hBU19SRVNFVF9DT05UUk9MTEVS
PXkKJCAgbGludXggZ2l0OihrMjMwX2R0X2luaXRpYWxfdjMpCmBgYAoKQXMgeW91IGNhbiBzZWUs
IHdlIG9ubHkgaGF2ZSBzb21lIGRyaXZlcnMgZW5hYmxlZCBmb3IgSzIxMCBhbmQKQ09ORklHX0FS
Q0hfSEFTX1JFU0VUX0NPTlRST0xMRVIgYmVpbmcgZW5hYmxlZC4gVGhlIG5leHQgZ3JlcCAtciBz
aG93cyBpdApkb2VzIG5vdCBjaGFuZ2UgdGhlIGtlcm5lbCBiZWhhdmlvci4KCj4+IENPTkZJR19T
TVA9eQo+PiBDT05GSUdfSE9UUExVR19DUFU9eQo+PiBDT05GSUdfUE09eQo+IAo+IC0tIAo+IERh
bWllbiBMZSBNb2FsCj4gV2VzdGVybiBEaWdpdGFsIFJlc2VhcmNoCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
