Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D96CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5oTxZxDbUD6nSToakSkwqf8o5SdirD2G0fU74EKFOeY=; b=loFgvI/FAlHfd5
	X8B7KwpzJZOB+Zw9s87iHih9oXzd8/4WIfPnpXvid/PsdinH5uOBLRobkWyK4J+qXZVs86XQ4/ea0
	EZJROqxiBmbaFKrmTdBsyopNpZ00HW2dNYC660QHhCDumCX4qDVdXJgM9MqY9Y5wBBFYPG1hjzIMr
	WInx8m42kLKX8RFcl7vXv8DlzbbDpgBmbaZKI8Zf0W9cjCCJDBeh+0egoiXWVU4aqdTWpFw3gwQSZ
	4Q2XZ6BIcDjc8w0Vt1O2DJEnU1U1lOLPyEk3SxJQHvZhFTBjezHXDo9+HGu/F0OEfneKqGQkv76AY
	oOzDRmbXZ7RAYxVrbBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVDw-000ErH-0k;
	Thu, 19 Oct 2023 15:46:12 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVDs-000EpT-2k
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 15:46:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c9b70b9656so54395575ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697730367; x=1698335167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/1Sbnu2zG2XHrvwhNz0MNl6g+38tRSerwv//oFJB9A=;
        b=Fm8vzGVI8KxKLltZTUZ+C0y1JHDZCVfYDG8GFaf1PjQZOXaGOKu+QFTmXsWMWBU+et
         /xtJm8fY9esDO0ne+F/OAcm+fhdO96EtLA0+Aj1KfKmkfUBA41wGx7XLKumfGq5o+wtg
         k2EKEokQiP08Abip/z/Gl4Kdxd+40VzxxOTxDunxFjdZeJUGO8kVxIZotX7jwCSpaakl
         OO4pZarsBfD6F42A8agWgOlivCxOWugtpr62q5gCXS/a2py/oBfG2K9pmooW7tP2HJ1o
         GGR0MAKlM31WK5dALWFI14gBZKV0lkaRw5/PdStKjv0MKOZ8mL2mHwjpNf8+kBCG6t3a
         ikiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697730367; x=1698335167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/1Sbnu2zG2XHrvwhNz0MNl6g+38tRSerwv//oFJB9A=;
        b=lSWHTLlpzBdrjbLcVq1POCP/etwyvPPzTh76Gj6WMXQLjw/XOUFTmw9581rYXGHRXU
         0q+Sqn/kG5Vc8zWm22N+2hjJoLBksQ6eoTzrYGeFow9OuSBmndV68ws6d6uXdDv9g6rS
         Lk/NyeLG/n8PU0NilqXcbtSYv4j2rZbX6bKkP3K8IxbKmP4JbOBCJ/c+nGQ6FnyJGfNL
         zelzBOPCPDKHXMy1eYy7REukLIgBBn5YcVdq3Fa5dn7sSIPAjlipAqhi1WVZj71QfRQ+
         aDxYsL9kmkfQ0aCYNtMHlij6nK2c4mVFP/k6xSm/lkoxmbdxnTtKastUQ9yEzHjltnY5
         4KIQ==
X-Gm-Message-State: AOJu0YzJxwspIZwE4+HuWZMrmdL+4r7NwKH+nPcyYEbgOFA8iLZRUPku
	bM/GTAMgUjoKdPT33I6ANQap3bUeToYxsdNnUt/Aysi4E8Vc0w4CZ+Z2wmmvDYnHdRVu2NkSfJ7
	noX4W8sjqdrq+eCGVZPfPOrKC+aMVFWaepA3Cw1rlvNkPoy8WPIvO8gZLImbiPjM5hK1BVhiSwi
	4wSfu/r/nl66+5T5w=
X-Google-Smtp-Source: AGHT+IE27JQz2UPJW0efo195prSmXNVZmNPh8ibKWlGZSPbeJqARe8WFpbn3Kkee3+FQKSYhEKPZ7w==
X-Received: by 2002:a17:902:fa83:b0:1c9:ccbd:6867 with SMTP id lc3-20020a170902fa8300b001c9ccbd6867mr2597923plb.38.1697730366638;
        Thu, 19 Oct 2023 08:46:06 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id u8-20020a17090282c800b001c75d7f2597sm2084710plz.141.2023.10.19.08.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 08:46:05 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v3, 0/5] riscv: support kernel-mode Vector
Date: Thu, 19 Oct 2023 15:45:47 +0000
Message-Id: <20231019154552.23351-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_084608_962020_C4BA003C 
X-CRM114-Status: GOOD (  16.73  )
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

VGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBmb3IgcnVubmluZyBWZWN0b3IgY29kZSBpbiBr
ZXJuZWwgbW9kZS4gVGhlCmltcGxlbWVudGF0aW9uIGlzIGJhc2VkIG9uIHRoZSB2MTIgc2VyaWVz
IG9mIHRoZSBWZWN0b3Igc2VyaWVzLCBidXQgd2l0aApzb21lIGFkZGl0aW9ucy4gRmlyc3QsIHBh
dGNoIDEsIDIgYWRkIHRoZSBrZXJuZWwtbW9kZSBWZWN0b3IgcGF0Y2ggZnJvbQp2MTIgd2l0aCBt
aW5vciBtb2RpZmljYXRpb25zLiBUaGVuLCB3ZSBpbnRyb2R1Y2UgYSBtZWNoYW5pc20gdG8gZGVm
ZXIKcmVzdG9yaW5nIFZlY3RvciBjb250ZXh0IGZvciB1c2Vyc3BhY2UgcHJvZ3JhbXMgKHBhdGNo
IDMpLiBUaGlzIGlzCnNpbWlsYXIgdG8gYXJtNjQgYW5kIHg4NidzIGFwcHJvYWNoZXMgd2hlbiBk
ZWFsaW5nIHdpdGggZXh0cmEgdXNlcnNwYWNlCnJlZ2lzdGVyIGNvbnRleHQuIEFuZCBpdCBpcyBi
ZW5lZml0aWFsIHRvIGJvdGggVmVjdG9yIGluIHVzZXIgYW5kCmtlcm5lbC1tb2RlLiBBdCB0aGUg
ZW5kIG9mIHRoZSBzZXJpZXMsIHBhdGNoIDQsIDUgYWRkIHN1cHBvcnRzIGZvcgptYWtpbmcga2Vy
bmVsLW1vZGUgVmVjdG9yIGNvZGUgcHJlZW1wdGlibGUuIFdlIGRvIHRoaXMgYnkgYWRkaW5nCmtl
cm5lbC1tb2RlIFZlY3RvciBjb250ZXh0LCBhbmQga2VlcGluZyB0cmFjayBvZiB0aGUgZnJhbWUg
d2hlcmUgVgpjb250ZXh0IGlzIGxhc3QgdmFsaWQuIFdlIGJlbGlldmUgdGhhdCBlbmFibGluZyBw
cmVlbXB0aW9uIG9mIHJ1bm5pbmcgVgppcyBhIGNyaXRpY2FsIHBhdGggZm9yIGdldHRpbmcgViBt
b3JlIGdlbmVyYWxseSBhdmFpbGFibGUgaW4gdGhlCmtlcm5lbC1tb2RlLiBCZXNpZGVzLCB3aXRo
IHN0YXR1cy5WUywgd2UgY2FuIHRlbGwgaWYgc2F2aW5nL3Jlc3RvcmluZyBWCmlzIHJlcXVpcmVk
LiBTbyB3ZSBkb24ndCBoYXZlIHRvIHNhdmUvcmVzdG9yZSBleHRyYSBjb250ZXh0IGF0IGVhY2gK
Y29udGV4dCBzd2l0Y2ggaWYgcmVnaXN0ZXJzIGFyZSBub3QgZGlydHkuCgpUaGUgc2VyaWVzIGlz
IHRlc3RlZCBieSBsb2FkaW5nIGEga2VybmVsIG1vZHVsZSBvbiBhIFBSRUVNUFQga2VybmVsLgpU
aGUgbW9kdWxlIGxhdW5jaGVzIG11bHRpcGxlIGt3b3JrZXJzIHdoaWNoIHJ1biBWZWN0b3Igb3Bl
cmF0aW9ucyBhbmQKdmVyaWZpZXMgd2l0aCBzY2FsYXIgY29kZS4gQWxzbywgdGhlIG1vZHVsZSBw
cm92aWRlcyB1c2Vyc3BhY2UgaW50ZWZhY2VzCnZpYSBmb3BzIHRvIHZlcmlmeSBpZiB3ZSBjYW4g
cnVuIFZlY3RvciBjb2RlIG9uIHN5c2NhbGwgcGF0aC4KCk5vdGU6IHdlIHN0aWxsIGhhdmUgbm90
IGNvbWUgdG8gYSBjb25jbHVzaW9uIG9uIHdoZXRoZXIgYSBwcmVlbXBpdGJsZQprZXJuZWwtbW9k
ZSBzaW1kIGlzIGEgZ29vZCBhcHByb2FjaC4gQWxzbywgd2hldGhlciB0byB1c2UgdGhlIHNhbWUg
QVBJCnRvIGVuYWJsZSBpdC4gSSBhbSBwb3N0aW5nIHRoaXMgYWdhaW4gdG8gZml4IGtub3duIGlz
c3VlcyBhbmQgY29tbWVudHMKZnJvbSB2MiBhbmQgcHJvdmlkZSBhIHRvLWRhdGUgcmVmZXJlbmNl
IGZvciB3aG8gd2FudHMgdG8gZGV2ZWxvcAprZXJuZWwtbW9kZSBWZWN0b3Igb24gcmlzY3YuCgpV
cGRhdGVkIHBhdGNoZXMgKG9uIGN1cnJlbnQgb3JkZXIpOiAxLCAzLCA0LCA1Ck5ldyBwYXRjaDog
LQpVbmNoYW5nZWQgcGF0Y2g6IDIKRGVsZXRlZCBwYXRjaDogLQoKQ2hhbmdlbG9nIHYzOgogLSBS
ZWJhc2Ugb24gdG9wIG9mIHJpc2N2IGZvci1uZXh0ICg2LjYtcmMxKQogLSBGaXggYSBidWlsZCBp
c3N1ZSAoQ29ub3IpCiAtIEd1YXJkIHZzdGF0ZV9zYXZlLCB2c3RhdGVfcmVzdG9yZSB3aXRoIHtn
ZXQscHV0fV9jcHVfdmVjdG9yX2NvbnRleHQuCiAtIFNhdmUgViBjb250ZXh0IGFmdGVyIGRpc2Fi
bGluZyBwcmVlbXB0aW9uLiAoR3VvKQogLSBSZW1vdmUgaXJxc19kaXNhYmxlZCgpIGNoZWNrIGZy
b20gbWF5X3VzZV9zaW1kKCkuIChCasO2cm4pCiAtIENvbW1lbnQgYWJvdXQgbmVzdGluZyBWIGNv
bnRleHQuCgpDaGFuZ2Vsb2cgdjI6CiAtIGZpeCBidWlsZCBpc3N1ZXMKIC0gRm9sbG93IGFybSdz
IHdheSBvZiBzdGFydGluZyBrZXJuZWwtbW9kZSBzaW1kIGNvZGU6CiAgIC0gYWRkIGluY2x1ZGUv
YXNtL3NpbWQuaCBhbmQgcmVuYW1lIG1heV91c2VfdmVjdG9yKCkgLT4KICAgICBtYXlfdXNlX3Np
bWQoKQogICAtIHJldHVybiB2b2lkIGluIGtlcm5lbF92ZWN0b3JfYmVnaW4oKSwgYW5kIEJVR19P
TiBpZiBtYXlfdXNlX3NpbWQoKQogICAgIGZhaWxzCiAtIENoYW5nZSBuYW1pbmcgc2NoZW1lIGZv
ciBmdW5jdGlvbnMvbWFjcm9zIChDb25vcik6CiAgIC0gcmVtb3ZlIEtNVgogICAtICdzL3J2di92
ZWN0b3IvJwogICAtICdzL1JJU0NWX0lTQV9WX1BSRUVNUFRJVkVfS01WL1JJU0NWX0lTQV9WX1BS
RUVNUFRJVkUvJwogICAtICdzL1RJRl9SSVNDVl9WX0tNVi9USUZfUklTQ1ZfVl9LRVJORUxfTU9E
RS8nCgpBbmR5IENoaXUgKDMpOgogIHJpc2N2OiBzY2hlZDogZGVmZXIgcmVzdG9yaW5nIFZlY3Rv
ciBjb250ZXh0IGZvciB1c2VyCiAgcmlzY3Y6IHZlY3RvcjogZG8gbm90IHBhc3MgdGFza19zdHJ1
Y3QgaW50bwogICAgcmlzY3Zfdl92c3RhdGVfe3NhdmUscmVzdG9yZX0oKQogIHJpc2N2OiB2ZWN0
b3I6IGFsbG93IGtlcm5lbC1tb2RlIFZlY3RvciB3aXRoIHByZWVtcHRpb24KCkdyZWVudGltZSBI
dSAoMik6CiAgcmlzY3Y6IEFkZCBzdXBwb3J0IGZvciBrZXJuZWwgbW9kZSB2ZWN0b3IKICByaXNj
djogQWRkIHZlY3RvciBleHRlbnNpb24gWE9SIGltcGxlbWVudGF0aW9uCgogYXJjaC9yaXNjdi9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vZW50cnktY29tbW9uLmggIHwgIDE3ICsrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9j
ZXNzb3IuaCAgICAgfCAgIDIgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zaW1kLmggICAgICAg
ICAgfCAgNTYgKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5o
ICAgfCAgIDYgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCAgICAgICAgfCAgNTAg
KysrKysrKy0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3hvci5oICAgICAgICAgICB8ICA4MiAr
KysrKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgfCAg
IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyAgICAgICAgfCAgIDIgKwogYXJj
aC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgICAgICAgfCAgNDkgKysrKysrKysKIGFyY2gv
cmlzY3Yva2VybmVsL2tlcm5lbF9tb2RlX3ZlY3Rvci5jIHwgMTQ4ICsrKysrKysrKysrKysrKysr
KysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICAgIHwgIDEwICst
CiBhcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyAgICAgICAgICAgICB8ICAgNyArLQogYXJjaC9y
aXNjdi9rZXJuZWwvc2lnbmFsLmMgICAgICAgICAgICAgfCAgIDcgKy0KIGFyY2gvcmlzY3Yva2Vy
bmVsL3ZlY3Rvci5jICAgICAgICAgICAgIHwgICA1ICstCiBhcmNoL3Jpc2N2L2xpYi9NYWtlZmls
ZSAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2xpYi94b3IuUyAgICAgICAgICAg
ICAgICAgICB8ICA4MSArKysrKysrKysrKysrKwogMTcgZmlsZXMgY2hhbmdlZCwgNTE2IGluc2Vy
dGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2ltZC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS94b3IuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2tlcm5lbF9t
b2RlX3ZlY3Rvci5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIveG9yLlMKCi0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
