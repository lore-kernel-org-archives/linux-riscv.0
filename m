Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84432C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IQP/S9QIo10s0aVI3VIUqfTCEOuwDSWG6S3wbr7HXkc=; b=16UH3WNFTkIcsu
	LSc5EB5xaXpkWntn85Vtf7yPXws7DCJtOorzFqAYqTgMBahZjkL7O3gP8HfjY/retpGKejNcOazxp
	v1ra8i4o1yS77Qwq0ukvWIlJYxkzjxV6hVqRjx/rb9OUc9gOvjHOn7qpa20EvVy5BgqXKpnYLtOvn
	p54tKhV4KX+k8UQGXn52RtzC0sPqDnrkCiEVBaxC/XA5TILShA6zi7qAeYdWp94R6ehcYIvlP8dOs
	TG/cy+Y23C/3nll3DGk/XjfJfD0GG2BLCs27foLEU3BB1XVul5PlpzfdpAhrpSKSPiBDZIONhkiQl
	5MH8zdxSr5hfqsYpe2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJKl-0031XP-0C;
	Thu, 21 Dec 2023 13:43:31 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJKi-0031W3-1L
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:43:30 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5cd54e5fbb2so351757a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 05:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703166205; x=1703771005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3KNa9AnSJE/Di5gNTgZNEwGJWU9DjXcRbTulcD+gAQ=;
        b=CXe7/cYYdBrpdDLKDan3cBo0/iIyqtI4H4iZWB9hujtZhhFk30azjLa5vL6kiMyuy7
         vvq2JFWT3fIPcEhTspi/BWm3ZIEcoQpLRdHQJp2zpZCU6NWTByWCPES73oNRFwt15uMa
         bP/BXRW/MXUT+EpGWHYFb5ou43Jp134uexQDzT2QwcnU872B3QKiFOXo5vYoMcp1o4Hq
         UYIJWsBf0fz5GB3SM4On9r3tlUBt8Zvm2bryv6cOzk3PKxufrCjyZVVpgzyOb0Csugx2
         QXXuhHfrFGhMrQxeungTpKclVyWw0C52hqavHLieFRLXlX86wYe4kGo4U679bE9dt5/r
         neFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166205; x=1703771005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3KNa9AnSJE/Di5gNTgZNEwGJWU9DjXcRbTulcD+gAQ=;
        b=OvjhHhayHoZ8zAbz4x8FeE60lB2/clTtYF9kIERSbUbCCpBRn7Yn8KPkOQILOvh+uc
         IcPEKqXA+FDhMLv7+FEGdZoZsU96KuQ/Fzp0XtE4QCRS0+ZmJ3zeAntfN6BNiBFBTp0F
         rOuYjLGIggCPIrhgC4JhBpDG0vrRe+ljohbr2m+j0dT2LtWiD4SVSsB3npkORaXdwBlE
         ParjYoLsam1o0aubzxDh4HwJRaoOYWxQcE+jBRmmT3naNSg/2l6rrOH5iP6jfRD9NZVt
         Yz0QB/vj1fkH2dh5AODthD70qv13C+FrF+/IZl/3utqyQQOxe8NGXPIILu4brNNI//tE
         E5JQ==
X-Gm-Message-State: AOJu0YzxJyEXUxAN5388lDF3aK1lpDtluVH/cS/MchDIP6DjndcPd8NO
	F9zX0vA1GiNsehk21QUcrJ2ajKtN5H//yyuQLTFKv/73wwnapWkcu+k2bkO5S3WJo723nsedprb
	DoGdZTHqjD3NWiwaObzVzSNXMic54WK69Sg5qbIBmVIePWYF9MHNUY/zdlRAkMcHm3m6TfjETRA
	ZfLHiPHJguphM/
X-Google-Smtp-Source: AGHT+IGc+qTk5KIh0CzKbQ9K1MW9q6LvvFwre+6H/Qlqp4IA9wlxKKZYhtc8pZEoGfqnst1k/oBOsA==
X-Received: by 2002:a17:90a:fc96:b0:28c:168:a476 with SMTP id ci22-20020a17090afc9600b0028c0168a476mr64770pjb.44.1703166204923;
        Thu, 21 Dec 2023 05:43:24 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001c72d5e16acsm1646001plb.57.2023.12.21.05.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:43:24 -0800 (PST)
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
Subject: [v7, 00/10] riscv: support kernel-mode Vector
Date: Thu, 21 Dec 2023 13:43:07 +0000
Message-Id: <20231221134318.28105-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_054328_466157_9F39CC34 
X-CRM114-Status: GOOD (  16.70  )
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
IGJhY2tncm91bmQuIFRoZSBtb2R1bGUgdGhhdCB0ZXN0cwp0aGVzZSBvcGVyYXRpb24gaXMgZXhw
ZWN0ZWQgdG8gYmUgdXBzdHJlYW0gbGF0ZXIuCgp2NiBvZiB0aGlzIHNlcmllcyBjYW4gYmUgZm91
bmQgYXQgWzFdCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzEyMjAwNzU0
MTIuMjQwODQtMS1hbmR5LmNoaXVAc2lmaXZlLmNvbS8KClBhdGNoIHN1bW1hcnk6CiAtIFVwZGF0
ZWQgcGF0Y2hlczogMSwgMywgNgogLSBOZXcgcGF0Y2g6IG5vbmUKIC0gVW5jaGFuZ2VkIHBhdGNo
OiAyLCA0LCA1LCA3LCA4LCA5LCAxMAogLSBEZWxldGVkIHBhdGNoOiBub25lCgpDaGFuZ2Vsb2cg
djc6Ci0gRml4IGJ1aWxkIGZhaWwgZm9yIGFsbG1vZGNvbmZpZyBhbmQgdGVzdCBidWlsZGluZyB0
aGUgc2VyaWVzIHdpdGgKICBhbGxtb2Rjb25maWcvYWxseWVzY29uZmlnCgpDaGFuZ2Vsb2cgdjY6
CiAtIFByb3ZpZGUgYSBtb3JlIHJvYnVzdCBjaGVjayBvbiB0aGUgdXNlIG9mIG5vbi1wcmVlbXB0
aWJsZSBWZWN0b3IuCiAtIEFkZCBLY29uZmlncyB0byBzZXQgdGhyZXNob2xkIHZhbHVlIGF0IGNv
bXBpbGUgdGltZS4gKENoYXJsaWUpCiAtIEFkZCBhIHBhdGNoIHRvIHV0aWxpemUga21lbV9jYWNo
ZV8qIGZvciBWIGNvbnRleHQgYWxsb2NhdGlvbnMuCiAtIFJlLXdyaXRlIGFuZCBhZGQgcHJlZW1w
dGlibGUgVmVjdG9yLgoKQ2hhbmdlbG9nIHY1OgogLSBSZWJhc2Ugb24gdG9wIG9mIHJpc2N2IGZv
ci1uZXh0ICg2LjctcmMxKQpDaGFuZ2Vsb2cgdjQ6CiAtIFVzZSBrZXJuZWxfdl9mbGFncyBhbmQg
aGVscGVycyB0byB0cmFjayB2ZWN0b3IgY29udGV4dC4KIC0gUHJldmVudCBzb2Z0aXJxIGZyb20g
bmVzdGluZyBWIGNvbnRleHQgZm9yIG5vbi1wcmVlbXB0IFYKIC0gQWRkIHVzZXIgY29weSBhbmQg
bWVtKiByb3V0aW5lcwoKQ2hhbmdlbG9nIHYzOgogLSBSZWJhc2Ugb24gdG9wIG9mIHJpc2N2IGZv
ci1uZXh0ICg2LjYtcmMxKQogLSBGaXggYSBidWlsZCBpc3N1ZSAoQ29ub3IpCiAtIEd1YXJkIHZz
dGF0ZV9zYXZlLCB2c3RhdGVfcmVzdG9yZSB3aXRoIHtnZXQscHV0fV9jcHVfdmVjdG9yX2NvbnRl
eHQuCiAtIFNhdmUgViBjb250ZXh0IGFmdGVyIGRpc2FibGluZyBwcmVlbXB0aW9uLiAoR3VvKQog
LSBSZW1vdmUgaXJxc19kaXNhYmxlZCgpIGNoZWNrIGZyb20gbWF5X3VzZV9zaW1kKCkuIChCasO2
cm4pCiAtIENvbW1lbnQgYWJvdXQgbmVzdGluZyBWIGNvbnRleHQuCgpDaGFuZ2Vsb2cgdjI6CiAt
IGZpeCBidWlsZCBpc3N1ZXMKIC0gRm9sbG93IGFybSdzIHdheSBvZiBzdGFydGluZyBrZXJuZWwt
bW9kZSBzaW1kIGNvZGU6CiAgIC0gYWRkIGluY2x1ZGUvYXNtL3NpbWQuaCBhbmQgcmVuYW1lIG1h
eV91c2VfdmVjdG9yKCkgLT4KICAgICBtYXlfdXNlX3NpbWQoKQogICAtIHJldHVybiB2b2lkIGlu
IGtlcm5lbF92ZWN0b3JfYmVnaW4oKSwgYW5kIEJVR19PTiBpZiBtYXlfdXNlX3NpbWQoKQogICAg
IGZhaWxzCiAtIENoYW5nZSBuYW1pbmcgc2NoZW1lIGZvciBmdW5jdGlvbnMvbWFjcm9zIChDb25v
cik6CiAgIC0gcmVtb3ZlIEtNVgogICAtICdzL3J2di92ZWN0b3IvJwogICAtICdzL1JJU0NWX0lT
QV9WX1BSRUVNUFRJVkVfS01WL1JJU0NWX0lTQV9WX1BSRUVNUFRJVkUvJwogICAtICdzL1RJRl9S
SVNDVl9WX0tNVi9USUZfUklTQ1ZfVl9LRVJORUxfTU9ERS8nCgpBbmR5IENoaXUgKDgpOgogIHJp
c2N2OiB2ZWN0b3I6IG1ha2UgVmVjdG9yIGFsd2F5cyBhdmFpbGFibGUgZm9yIHNvZnRpcnEgY29u
dGV4dAogIHJpc2N2OiBzY2hlZDogZGVmZXIgcmVzdG9yaW5nIFZlY3RvciBjb250ZXh0IGZvciB1
c2VyCiAgcmlzY3Y6IGxpYjogdmVjdG9yaXplIGNvcHlfdG9fdXNlci9jb3B5X2Zyb21fdXNlcgog
IHJpc2N2OiBsaWI6IGFkZCB2ZWN0b3JpemVkIG1lbSogcm91dGluZXMKICByaXNjdjogdmVjdG9y
OiBkbyBub3QgcGFzcyB0YXNrX3N0cnVjdCBpbnRvCiAgICByaXNjdl92X3ZzdGF0ZV97c2F2ZSxy
ZXN0b3JlfSgpCiAgcmlzY3Y6IHZlY3RvcjogdXNlIGEgbWFzayB0byB3cml0ZSB2c3RhdGVfY3Ry
bAogIHJpc2N2OiB2ZWN0b3I6IHVzZSBrbWVtX2NhY2hlIHRvIG1hbmFnZSB2ZWN0b3IgY29udGV4
dAogIHJpc2N2OiB2ZWN0b3I6IGFsbG93IGtlcm5lbC1tb2RlIFZlY3RvciB3aXRoIHByZWVtcHRp
b24KCkdyZWVudGltZSBIdSAoMik6CiAgcmlzY3Y6IEFkZCBzdXBwb3J0IGZvciBrZXJuZWwgbW9k
ZSB2ZWN0b3IKICByaXNjdjogQWRkIHZlY3RvciBleHRlbnNpb24gWE9SIGltcGxlbWVudGF0aW9u
CgogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDQ2ICsrKysrCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmggfCAgMTQgKysKIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmggICB8ICAxNyArKwogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wcm9jZXNzb3IuaCAgICAgIHwgIDM5ICsrKystCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NpbWQuaCAgICAgICAgICAgfCAgNjQgKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS90aHJlYWRfaW5mby5oICAgIHwgICAyICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9y
LmggICAgICAgICB8IDEwMyArKysrKysrKysrLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9y
LmggICAgICAgICAgICB8ICA2OCArKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUg
ICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAg
ICAgICB8ICAgOCArCiBhcmNoL3Jpc2N2L2tlcm5lbC9rZXJuZWxfbW9kZV92ZWN0b3IuYyAgfCAy
MTIgKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMg
ICAgICAgICAgICAgfCAgMTQgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jICAgICAgICAg
ICAgICB8ICAgNyArLQogYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMgICAgICAgICAgICAgIHwg
ICA3ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyAgICAgICAgICAgICAgfCAgNTAgKysr
KystCiBhcmNoL3Jpc2N2L2xpYi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDYgKwogYXJj
aC9yaXNjdi9saWIvbWVtY3B5X3ZlY3Rvci5TICAgICAgICAgIHwgIDI5ICsrKysKIGFyY2gvcmlz
Y3YvbGliL21lbW1vdmVfdmVjdG9yLlMgICAgICAgICB8ICA0OSArKysrKysKIGFyY2gvcmlzY3Yv
bGliL21lbXNldF92ZWN0b3IuUyAgICAgICAgICB8ICAzMyArKysrCiBhcmNoL3Jpc2N2L2xpYi9y
aXNjdl92X2hlbHBlcnMuYyAgICAgICAgfCAgNjQgKysrKysrKwogYXJjaC9yaXNjdi9saWIvdWFj
Y2Vzcy5TICAgICAgICAgICAgICAgIHwgIDEwICsrCiBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzX3Zl
Y3Rvci5TICAgICAgICAgfCAgNTAgKysrKysrCiBhcmNoL3Jpc2N2L2xpYi94b3IuUyAgICAgICAg
ICAgICAgICAgICAgfCAgODEgKysrKysrKysrCiAyMyBmaWxlcyBjaGFuZ2VkLCA5NDggaW5zZXJ0
aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zaW1kLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3hvci5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21v
ZGVfdmVjdG9yLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2xpYi9tZW1jcHlfdmVj
dG9yLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2xpYi9tZW1tb3ZlX3ZlY3Rvci5T
CiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIvbWVtc2V0X3ZlY3Rvci5TCiBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIvcmlzY3Zfdl9oZWxwZXJzLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzX3ZlY3Rvci5TCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9saWIveG9yLlMKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
