Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169B9C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hsUo6Zycej43rdmrHtiGU9c4KgVsO7I8i9bHfN6sino=; b=QHVIzq00XHjsrQut8C1vqgMRu7
	j2IDYk+1xBC7qcKVBtSkKESxuzxQWqKXjcMLSDlqZ0Tlyb1pwTQ2Y4LVkEVApVA2CL8EL7TBrPlJ0
	W/ba85bMV1zYPnWKdsxp7rTotc3DHFOld+LCSkQ6OBdilh8RzlHzXomkzwdWGl/tfpNr/bTc1nsX1
	Rb4n9g5iTja8i3V9POmo8YqHHceE51dP+/pZYmVbWwHnvNgxTOugIqQHiTgKWnBvyQGGrEpszYhQF
	VrzHX4EP5Vd2PjjeitopYW77t5R+vGe54YwrL1zl23g1OaEmydYJmVlhiblOx9+FCttmtXDRoUMcu
	+23COWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqo-00000003NoA-1Dmu;
	Fri, 10 May 2024 00:11:03 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dq7-00000003NBT-3A2t
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:39 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2b4330e5119so1234191a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299816; x=1715904616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCYOcoi79dGlWA0zgP2ejSPuqCPcThdX6+6Ym86nj5Q=;
        b=EulBNZ4pqa+s8oI/Bj6RLFyyimX13FkEtf6/eF0DqYh7pdq70cr1/eKJT/wTb75evG
         OaNDbBQG3xPUZ7IH1kGZqDfcOmwsKQHG4fnWmMYPLim9IdUbnY/BlilkA/q6PbBRo4cn
         g+iK92yPuHTBxrojlSHTKwXNLL7VwxsHYCBrObIPy2I3Kk8/jDxwfs9U2/fmjSNG0KN1
         rYHLnsmsAmO7vZ9twmy6BD0x7so4idUr1YCCcCKTpwoNWgNzIHVkO6bxizvuWkFPjBP/
         +MCPrFwvpPrT7t25N/8HNgPFBaG7pNFDiPxPuXLY1Nms12fqq0Cifuc99kWtaoHh3/Fh
         NEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299816; x=1715904616;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tCYOcoi79dGlWA0zgP2ejSPuqCPcThdX6+6Ym86nj5Q=;
        b=HtKMAAWW6xx7LLDkaa0QMgnIb329gujYl+Q9W/aw+4oTWXLiVf6i0BZTTlpmM4Z9As
         OSXucA8tiOpp01B9SzDDlnu8kfZa/OMX9gxfXD3wE/Au3ooE+EsLLIh2212c4Us4nO6/
         5vxakn+Sgs0XQD+aUGvTI1Ug/Hv7+hnz1JbYYOwq+L5lIbEotFUuy1RPkJp2ilDv/YX4
         uX2+3q+2jEixG5EiStJld4W8Klt9CobWZHXbY19H4EPlw/dAKstJiyxW4qgWD3XpHLk9
         bTf+W9N5GGFmLmXjA4ilvIFCMKP1vdVJk4Iqyohb/Y973wrYRcQYLdt/CUaoCgMAOWT4
         kqeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxLkwIR+Vt+n8ia63bHMzwCglnUvXv3XeMULDo0KgHJhAwG20ZkZFP76tFEVt7yUe7xCzUJuiuWuBMZM2PO8+hpw+jysS5HP/IHl5PY3zt
X-Gm-Message-State: AOJu0YzY6thwyd0VIiVEQZeA0YTQlb4tnZVbuVxavTmg8dYiAjr1CHSn
	tOBwj2U/AskRdhLBLQaCz/X/Uhf5g7kaK69BxADtAkQ0yJjZ9I8taWIuQXSDWF36X9ZassR8r5Q
	YXg==
X-Google-Smtp-Source: AGHT+IF9aZrvH9iVwela8h8gnuxSKtgNwX9HeGP3w0cBXhyQMMnBKIlrQWbDb+A4TrctySesXZTy2+mRcOk=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90b:1850:b0:2b6:208f:a441 with SMTP id
 98e67ed59e1d1-2b6ccd85d53mr3578a91.7.1715299816087; Thu, 09 May 2024 17:10:16
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:43 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-27-edliaw@google.com>
Subject: [PATCH v4 26/66] selftests/lsm: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_171020_251203_1567E7E8 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

X0dOVV9TT1VSQ0UgaXMgcHJvdmlkZWQgYnkgbGliLm1rLCBzbyBpdCBzaG91bGQgYmUgZHJvcHBl
ZCB0byBwcmV2ZW50CnJlZGVmaW5pdGlvbiB3YXJuaW5ncy4KClJldmlld2VkLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBNdWhhbW1hZCBVc2FtYSBB
bmp1bSA8dXNhbWEuYW5qdW1AY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogRWR3YXJkIExp
YXcgPGVkbGlhd0Bnb29nbGUuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9j
b21tb24uYyAgICAgICAgICAgICAgICAgfCAyIC0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9s
c20vbHNtX2dldF9zZWxmX2F0dHJfdGVzdC5jIHwgMiAtLQogdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvbHNtL2xzbV9saXN0X21vZHVsZXNfdGVzdC5jICB8IDIgLS0KIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2xzbS9sc21fc2V0X3NlbGZfYXR0cl90ZXN0LmMgfCAyIC0tCiA0IGZpbGVzIGNoYW5n
ZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bHNtL2NvbW1vbi5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2NvbW1vbi5jCmluZGV4
IDlhZDI1ODkxMjY0Ni4uMWIxOGFhYzU3MGYxIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9sc20vY29tbW9uLmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2Nv
bW1vbi5jCkBAIC00LDggKzQsNiBAQAogICoKICAqIENvcHlyaWdodCDCqSAyMDIzIENhc2V5IFNj
aGF1ZmxlciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4KICAqLwotCi0jZGVmaW5lIF9HTlVfU09V
UkNFCiAjaW5jbHVkZSA8bGludXgvbHNtLmg+CiAjaW5jbHVkZSA8ZmNudGwuaD4KICNpbmNsdWRl
IDxzdHJpbmcuaD4KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21f
Z2V0X3NlbGZfYXR0cl90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX2dl
dF9zZWxmX2F0dHJfdGVzdC5jCmluZGV4IGRmMjE1ZTRhYTYzZi4uNzQ2NWJkZTNmOTIyIDEwMDY0
NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX2dldF9zZWxmX2F0dHJfdGVz
dC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fZ2V0X3NlbGZfYXR0cl90
ZXN0LmMKQEAgLTUsOCArNSw2IEBACiAgKgogICogQ29weXJpZ2h0IMKpIDIwMjIgQ2FzZXkgU2No
YXVmbGVyIDxjYXNleUBzY2hhdWZsZXItY2EuY29tPgogICovCi0KLSNkZWZpbmUgX0dOVV9TT1VS
Q0UKICNpbmNsdWRlIDxsaW51eC9sc20uaD4KICNpbmNsdWRlIDxmY250bC5oPgogI2luY2x1ZGUg
PHN0cmluZy5oPgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2xzbV9s
aXN0X21vZHVsZXNfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2xzbV9saXN0
X21vZHVsZXNfdGVzdC5jCmluZGV4IDA2ZDI0ZDQ2NzlhNi4uYTZiNDRlMjVjMjFmIDEwMDY0NAot
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX2xpc3RfbW9kdWxlc190ZXN0LmMK
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2xzbV9saXN0X21vZHVsZXNfdGVzdC5j
CkBAIC01LDggKzUsNiBAQAogICoKICAqIENvcHlyaWdodCDCqSAyMDIyIENhc2V5IFNjaGF1Zmxl
ciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4KICAqLwotCi0jZGVmaW5lIF9HTlVfU09VUkNFCiAj
aW5jbHVkZSA8bGludXgvbHNtLmg+CiAjaW5jbHVkZSA8c3RyaW5nLmg+CiAjaW5jbHVkZSA8c3Rk
aW8uaD4KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fc2V0X3Nl
bGZfYXR0cl90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX3NldF9zZWxm
X2F0dHJfdGVzdC5jCmluZGV4IDY2ZGVjNDdlM2NhMy4uMTEwYzZhMDdlNzRjIDEwMDY0NAotLS0g
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vbHNtX3NldF9zZWxmX2F0dHJfdGVzdC5jCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fc2V0X3NlbGZfYXR0cl90ZXN0LmMK
QEAgLTUsOCArNSw2IEBACiAgKgogICogQ29weXJpZ2h0IMKpIDIwMjIgQ2FzZXkgU2NoYXVmbGVy
IDxjYXNleUBzY2hhdWZsZXItY2EuY29tPgogICovCi0KLSNkZWZpbmUgX0dOVV9TT1VSQ0UKICNp
bmNsdWRlIDxsaW51eC9sc20uaD4KICNpbmNsdWRlIDxzdHJpbmcuaD4KICNpbmNsdWRlIDxzdGRp
by5oPgotLSAKMi40NS4wLjExOC5nN2ZlMjljOThkNy1nb29nCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
