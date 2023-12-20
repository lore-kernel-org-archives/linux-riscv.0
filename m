Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0619CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 07:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nx/FrjSOrVEIvIn7uYcB4wumk6le1SX7eSRXoEXhSwo=; b=0pGzhrg/4w0tEi
	IfNn02WK+5nNSGNX6rZjG72MsYJG0NrnC8iPKCiTlVCWqnOajxZS52NslT6nz8TgX3yctf8ucMgvO
	Vo9bAd0yHMW1+ZKj+eYHzF8jHPuHyMSJZFLkkd8WnbcG2Xc3WEa/oaELXCAjfK/mbCBBiZKBD+yI9
	IkzxeI49PGoXcM91cj3Nw93B/9s9dXBWt3CG7JHPI8fjkC2LwOV1KtQYXrYSTBnlonIyEu+smPKv/
	11JsTj+GHxPKZ2HMkvv3FWTF6m8QDWlQpvnNYyA/KPawc5UwAI5nSP9/4CU7rocaJ7a2Rar3kSd6p
	bzirotj3bCvT7J6/qQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrRy-00GUHT-1F;
	Wed, 20 Dec 2023 07:57:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrRv-00GUG5-2B
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 07:57:05 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d3e416f303so7031875ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 23:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703059019; x=1703663819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BdzoMQiXq1+xyOC1DiyAXBbEpg2SAWo3Xz+Mk18/zJM=;
        b=ZC8iyA5ADUKIcYpfe6UzDuVKDcIiFUMuT4H30ZQ3QMkRCGhV8hd+vERWNMGzbhUgDD
         F63azHtdyXwAClKy4+2EgUWJnxy6NveGAOru7d37Z6tMnrVyDEEoPTZr66iOJXL2MBil
         1gYsd8fJS2g+57z8r73gBREDZOZRbHcHD16G1hI6uJRr5bDVDbNbjT9JsVaG5QmF1Zyn
         cQIElYVZZS6DmSzFsGIr9ujFd/EHmihWMsOMnvw4hcjT1jnuGmprYujPpd7T92cxb+nh
         If/gMg5FLkYvDJtTo7IpKqleRQFpZ1+bh5W99VSMMsk3hS/JFnHqmMD6WgthDDnx20Dd
         FzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059019; x=1703663819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdzoMQiXq1+xyOC1DiyAXBbEpg2SAWo3Xz+Mk18/zJM=;
        b=Dn4o0jS1MgzVlcCSKPdxRm1OGC+0x3LeVppWWWFvm6cOD6y3oOlAbrVI259ZBYP2K8
         rYEyN3oQF2iG0YrdxZXpWgDAomAVfCtewCI4JOXkpNWu/na3J9wlHC7Wixs3e16cahWb
         E0K71dX0jb12CLgebgDXQeqdB/fojvGswidCPN4LKqdyK2honWVrrqmgfl3dEXUtrs0E
         Bk2F1jwF/mED6vAj6dHOMtMc6pkFQNtoIxdP//iq1M7VkycdyQMc6XsyVpAdh2eCWstY
         oarqPi5J/PYYmMQyf4TcPTwCyCqQleotcpzCk01u2Lrw81AtBVyNAi/Pmj1nOKhRuurv
         iAvg==
X-Gm-Message-State: AOJu0YyEVz31bhYd3N9dPWDMgUoorZbN7m6TwSsgEp13Pg7veou0+nDF
	B39EXpHYSYKgro8KA0exn3tHKYVqG/FOiG1QydiXQTFR7bYA2lEwiuq0q2sHEgEqgV7toNqmj2U
	3hki1G+FoLdBW3/WTVmq5O3mkNfUmPMK5vasl0RklaJo0nBxbrvlqItaHK/VwT0oFyEq7oCuv7+
	BWf6qq3Fqym/38
X-Google-Smtp-Source: AGHT+IGDrE88EGbuHuOBSj94jAbUYqODTrV868/WdmWEeoq0hBPuOH8V16KlDcpqsnuXuttpF770tQ==
X-Received: by 2002:a17:902:684c:b0:1d3:f285:15a5 with SMTP id f12-20020a170902684c00b001d3f28515a5mr101960pln.35.1703059018790;
        Tue, 19 Dec 2023 23:56:58 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902789400b001cf8546335fsm3441453pll.5.2023.12.19.23.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:56:56 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v6, 00/10] riscv: support kernel-mode Vector
Date: Wed, 20 Dec 2023 07:54:02 +0000
Message-Id: <20231220075412.24084-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_235703_769102_45C3F3CF 
X-CRM114-Status: GOOD (  16.88  )
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
ZXJuZWwgbW9kZS4KQWxvbmcgd2l0aCB0aGUgc3Vwb3J0LCB3ZSBhZGQgc29tZSBWZWN0b3Igb3B0
aW1pemVkIHJvdXRpbmVzLiBBbmQKcHJvdmlkZSBhIHNpbXBsZSB0aHJlc2hvbGQgdG8gZGVjaWRl
IHdoZW4gdG8gcnVuIHRoZSB2ZWN0b3JpemVkCmZ1bmN0aW9ucy4KCkkgYW0gYWRkaW5nIGJhY2sg
cHJlZW1wdGlibGUgVmVjdG9yIGFzIHRoZXkgYXJlIHJlYWR5IGZvciByZXZpZXcgbm93LgpIYXZp
bmcgdGhlbSB0b2dldGhlciBtYWtlcyBpdCBlYXNpZXIgdG8gYmUgcmV2aWV3ZWQgYW5kIHRlc3Rl
ZC4KTWVhbndoaWxlLCBhcyB0aGV5IGFyZSBhcHBlbmRlZCBhdCB0aGUgZW5kLCB0aGlzIHNlcmll
cyBjYW4gYmUgbWVyZ2VkCmluY3JlbWVudGFsbHkgaWYgd2UgZmVlbCBhbnkgcGFydCBvZiB7MX40
LCA1fjYsIDd+MTB9IGlzIG1hdHVyZSBlbm91Z2guCgpUaGlzIHBhdGNoIGlzIHRlc3RlZCBvbiBh
IFFFTVUgd2l0aCBWIGFuZCB2ZXJpZmllZCB0aGF0IGJvb3RpbmcsIG5vcm1hbAp1c2Vyc3BhY2Ug
b3BlcmF0aW9ucyBhbGwgd29yayBhcyB1c3VhbCB3aXRoIHRocmVzaG9sZHMgc2V0IHRvIDAuIEFs
c28sCndlIHRlc3QgYnkgbGF1bmNoaW5nIG11bHRpcGxlIGtlcm5lbCB0aHJlYWRzIHdoaWNoIGNv
bnRpbnVvdXNseSBleGVjdXRlcwphbmQgdmVyaWZpZXMgVmVjdG9yIG9wZXJhdGlvbnMgaW4gdGhl
IGJhY2tncm91bmQuCgp2NSBvZiB0aGlzIHNlcmllcyBjYW4gYmUgZm91bmQgYXQgWzFdCgpMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzEyMTQxNTU3MjEuMTc1My0xLWFuZHku
Y2hpdUBzaWZpdmUuY29tLwoKUGF0Y2ggc3VtbWFyeSAob24gY3VycmVudCBvcmRlciwgN34xMCBh
cmUgY29tcGFyZWQgd2l0aCB2Myk6CiAtIFVwZGF0ZWQgcGF0Y2hlczogMSwgNSwgNiwgMTAKIC0g
TmV3IHBhdGNoOiA4LCA5CiAtIFVuY2hhbmdlZCBwYXRjaDogMiwgMywgNCwgNwogLSBEZWxldGVk
IHBhdGNoOiBub25lCgpDaGFuZ2Vsb2cgdjY6CiAtIFByb3ZpZGUgYSBtb3JlIHJvYnVzdCBjaGVj
ayBvbiB0aGUgdXNlIG9mIG5vbi1wcmVlbXB0aWJsZSBWZWN0b3IuCiAtIEFkZCBLY29uZmlncyB0
byBzZXQgdGhyZXNob2xkIHZhbHVlIGF0IGNvbXBpbGUgdGltZS4gKENoYXJsaWUpCiAtIEFkZCBh
IHBhdGNoIHRvIHV0aWxpemUga21lbV9jYWNoZV8qIGZvciBWIGNvbnRleHQgYWxsb2NhdGlvbnMu
CiAtIFJlLXdyaXRlIGFuZCBhZGQgcHJlZW1wdGlibGUgVmVjdG9yLgoKQ2hhbmdlbG9nIHY1Ogog
LSBSZWJhc2Ugb24gdG9wIG9mIHJpc2N2IGZvci1uZXh0ICg2LjctcmMxKQpDaGFuZ2Vsb2cgdjQ6
CiAtIFVzZSBrZXJuZWxfdl9mbGFncyBhbmQgaGVscGVycyB0byB0cmFjayB2ZWN0b3IgY29udGV4
dC4KIC0gUHJldmVudCBzb2Z0aXJxIGZyb20gbmVzdGluZyBWIGNvbnRleHQgZm9yIG5vbi1wcmVl
bXB0IFYKIC0gQWRkIHVzZXIgY29weSBhbmQgbWVtKiByb3V0aW5lcwoKQ2hhbmdlbG9nIHYzOgog
LSBSZWJhc2Ugb24gdG9wIG9mIHJpc2N2IGZvci1uZXh0ICg2LjYtcmMxKQogLSBGaXggYSBidWls
ZCBpc3N1ZSAoQ29ub3IpCiAtIEd1YXJkIHZzdGF0ZV9zYXZlLCB2c3RhdGVfcmVzdG9yZSB3aXRo
IHtnZXQscHV0fV9jcHVfdmVjdG9yX2NvbnRleHQuCiAtIFNhdmUgViBjb250ZXh0IGFmdGVyIGRp
c2FibGluZyBwcmVlbXB0aW9uLiAoR3VvKQogLSBSZW1vdmUgaXJxc19kaXNhYmxlZCgpIGNoZWNr
IGZyb20gbWF5X3VzZV9zaW1kKCkuIChCasO2cm4pCiAtIENvbW1lbnQgYWJvdXQgbmVzdGluZyBW
IGNvbnRleHQuCgpDaGFuZ2Vsb2cgdjI6CiAtIGZpeCBidWlsZCBpc3N1ZXMKIC0gRm9sbG93IGFy
bSdzIHdheSBvZiBzdGFydGluZyBrZXJuZWwtbW9kZSBzaW1kIGNvZGU6CiAgIC0gYWRkIGluY2x1
ZGUvYXNtL3NpbWQuaCBhbmQgcmVuYW1lIG1heV91c2VfdmVjdG9yKCkgLT4KICAgICBtYXlfdXNl
X3NpbWQoKQogICAtIHJldHVybiB2b2lkIGluIGtlcm5lbF92ZWN0b3JfYmVnaW4oKSwgYW5kIEJV
R19PTiBpZiBtYXlfdXNlX3NpbWQoKQogICAgIGZhaWxzCiAtIENoYW5nZSBuYW1pbmcgc2NoZW1l
IGZvciBmdW5jdGlvbnMvbWFjcm9zIChDb25vcik6CiAgIC0gcmVtb3ZlIEtNVgogICAtICdzL3J2
di92ZWN0b3IvJwogICAtICdzL1JJU0NWX0lTQV9WX1BSRUVNUFRJVkVfS01WL1JJU0NWX0lTQV9W
X1BSRUVNUFRJVkUvJwogICAtICdzL1RJRl9SSVNDVl9WX0tNVi9USUZfUklTQ1ZfVl9LRVJORUxf
TU9ERS8nCgpBbmR5IENoaXUgKDgpOgogIHJpc2N2OiB2ZWN0b3I6IG1ha2UgVmVjdG9yIGFsd2F5
cyBhdmFpbGFibGUgZm9yIHNvZnRpcnEgY29udGV4dAogIHJpc2N2OiBzY2hlZDogZGVmZXIgcmVz
dG9yaW5nIFZlY3RvciBjb250ZXh0IGZvciB1c2VyCiAgcmlzY3Y6IGxpYjogdmVjdG9yaXplIGNv
cHlfdG9fdXNlci9jb3B5X2Zyb21fdXNlcgogIHJpc2N2OiBsaWI6IGFkZCB2ZWN0b3JpemVkIG1l
bSogcm91dGluZXMKICByaXNjdjogdmVjdG9yOiBkbyBub3QgcGFzcyB0YXNrX3N0cnVjdCBpbnRv
CiAgICByaXNjdl92X3ZzdGF0ZV97c2F2ZSxyZXN0b3JlfSgpCiAgcmlzY3Y6IHZlY3RvcjogdXNl
IGEgbWFzayB0byB3cml0ZSB2c3RhdGVfY3RybAogIHJpc2N2OiB2ZWN0b3I6IHVzZSBrbWVtX2Nh
Y2hlIHRvIG1hbmFnZSB2ZWN0b3IgY29udGV4dAogIHJpc2N2OiB2ZWN0b3I6IGFsbG93IGtlcm5l
bC1tb2RlIFZlY3RvciB3aXRoIHByZWVtcHRpb24KCkdyZWVudGltZSBIdSAoMik6CiAgcmlzY3Y6
IEFkZCBzdXBwb3J0IGZvciBrZXJuZWwgbW9kZSB2ZWN0b3IKICByaXNjdjogQWRkIHZlY3RvciBl
eHRlbnNpb24gWE9SIGltcGxlbWVudGF0aW9uCgogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgfCAgNDYgKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNv
bW1vbi5oICB8ICAxNyArKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgICAg
fCAgMzkgKysrKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2ltZC5oICAgICAgICAgIHwgIDYy
ICsrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggICB8ICAgMiAr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oICAgICAgICB8IDEwMyArKysrKysrKysr
LS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmggICAgICAgICAgIHwgIDgyICsrKysrKysr
KysKIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgIHwgICAxICsKIGFyY2gv
cmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAgICAgIHwgICA4ICsKIGFyY2gvcmlzY3Yva2Vy
bmVsL2tlcm5lbF9tb2RlX3ZlY3Rvci5jIHwgMjEyICsrKysrKysrKysrKysrKysrKysrKysrKysK
IGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICAgIHwgIDE0ICstCiBhcmNoL3Jp
c2N2L2tlcm5lbC9wdHJhY2UuYyAgICAgICAgICAgICB8ICAgNyArLQogYXJjaC9yaXNjdi9rZXJu
ZWwvc2lnbmFsLmMgICAgICAgICAgICAgfCAgIDcgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rv
ci5jICAgICAgICAgICAgIHwgIDUwICsrKysrLQogYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgfCAgIDYgKwogYXJjaC9yaXNjdi9saWIvbWVtY3B5X3ZlY3Rvci5TICAgICAg
ICAgfCAgMjkgKysrKwogYXJjaC9yaXNjdi9saWIvbWVtbW92ZV92ZWN0b3IuUyAgICAgICAgfCAg
NDkgKysrKysrCiBhcmNoL3Jpc2N2L2xpYi9tZW1zZXRfdmVjdG9yLlMgICAgICAgICB8ICAzMyAr
KysrCiBhcmNoL3Jpc2N2L2xpYi9yaXNjdl92X2hlbHBlcnMuYyAgICAgICB8ICA2MCArKysrKysr
CiBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzLlMgICAgICAgICAgICAgICB8ICAxMCArKwogYXJjaC9y
aXNjdi9saWIvdWFjY2Vzc192ZWN0b3IuUyAgICAgICAgfCAgNTAgKysrKysrCiBhcmNoL3Jpc2N2
L2xpYi94b3IuUyAgICAgICAgICAgICAgICAgICB8ICA4MSArKysrKysrKysrCiAyMiBmaWxlcyBj
aGFuZ2VkLCA5NDIgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zaW1kLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3hvci5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNj
di9rZXJuZWwva2VybmVsX21vZGVfdmVjdG9yLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jp
c2N2L2xpYi9tZW1jcHlfdmVjdG9yLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2xp
Yi9tZW1tb3ZlX3ZlY3Rvci5TCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIvbWVt
c2V0X3ZlY3Rvci5TCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIvcmlzY3Zfdl9o
ZWxwZXJzLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzX3ZlY3Rv
ci5TCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIveG9yLlMKCi0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
