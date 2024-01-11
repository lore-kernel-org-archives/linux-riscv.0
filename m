Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8B4C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G8FEFbFONDxHYpDB1h7/5/xT3S834LVm5o0dciAVUII=; b=29SNVSNfXXAUq9
	P9aJAX28O5mcHFY0Wt+1BazjQfm8WcCyKhKESr/BMGIolBh08njs/7xlle0Q28s7PiKnFTff37lQD
	1pxYEAqDNXILxQ6I2uQb7in9QKaByntCKeOfsi5hGkpGRXeOBvKkm37CkqDeAHUIRvCfF1DEWLgho
	llHntlhNlWyf6g5L8OgePtVDEfUcP67htqoWLSWcmeI85w5fBoBS+Sx8bfMsIzLSvy2UmWTVAIv+S
	eX8MkMsHym1qhDie/E/mHJsQx0lq6ANUiWp7HX4D1v+npab+uWAusZVrxwelVq3jpbrDk8FZfDuF/
	7aPdrfnpRC453up1/w9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuuq-0007IE-13;
	Thu, 11 Jan 2024 13:16:12 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuun-0007He-0C
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 13:16:10 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso4021008a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 05:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704978967; x=1705583767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=slaT0MsVFLydqpDXErRLzDs5yBDLHQhej7B6K9n82ak=;
        b=XbyWA38c9iq9HelgQCmF5pks71nXXV/ijLwLp4pZwWtxsuYMna/dWFsJnA+iMfgpq2
         j43aHI+k5GrOKMw6AM70loNPnjIQkiYaaPCrn0u3rckoIe4egTeE5NzUKOvSWU5THOgw
         miSkb9ddGKSXNdimJqqDKJzuKSy89uCUblpkXjIupQMVHq20lNUWV6Jq2kSmFMya6B8o
         kXqsJ7eXTvrvc7fJZJb5ysI8xh4+oEvuJdRrbv5M3lkTObC8yMErKGf45sAEExcVWjsw
         y7wBUdQESZblZ227rX6JDkonTte+OAu9U3WZ9bS6b+FmW1+u6x/yMl9/Oo6EAqkwcGDS
         J3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704978967; x=1705583767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slaT0MsVFLydqpDXErRLzDs5yBDLHQhej7B6K9n82ak=;
        b=n+s8a4JnUQfcPBnCJFKtTzTUvBdLcpKtvc1QCelRjAxicU+OF1tpNC8mUqNLCxn/Pi
         P+jJE1my20q+csRM+T+o93iC5u4Kad253pjI3ASZwxpb4vDcYldEFwQCf8p2p/hLQ6F5
         Jcw6zOkeKaIbQOr/UlyVCXfLSpLjju4JjJM1wjPK1NbBQlABbX+RTdoxb0Ete60cMu8u
         vxMBVe4OT8HTI3ZhL7KNn7HftOH6AF2jjNCkE4y7jFmUPWXlGpL29Qjuv8/J9bXZAoff
         3VFJcv+Mi5IFp+0Vp3z3qNqUneAH5EEk3b/treU3OhHqo1sHgXVePWih4OMEUHvUO2+v
         N+Wg==
X-Gm-Message-State: AOJu0YzCkc1VV/ItWYPFLzZX8phZvsxqXBhWSUvQQv5qE6EcuByXCuGv
	Lkq9N4Ful07ONMx2hK5J9Xo3raUcQ51fFWSsf28Y5fSXYgTDEJIxNQl/Yj29IGxEhi4HgactXqW
	x7c9kysuutmD8xdjhsupurnrzAShT7LoTXm+PqdcoYgrgm7u6v8Q6+4J0pYVG1sM1SHcVjFDqKH
	q3CvJxJ3t2D91lYCQW/6sK
X-Google-Smtp-Source: AGHT+IHahjSONPKxAnurJsJc+15k5alR5RF3SODZ4jyoW/piPAC9UEYf9hOGz/1Ug5hdGRWXWbYYpA==
X-Received: by 2002:a05:6a20:8e01:b0:199:db4a:face with SMTP id y1-20020a056a208e0100b00199db4afacemr1073719pzj.85.1704978966938;
        Thu, 11 Jan 2024 05:16:06 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id ei30-20020a056a0080de00b006d9a6a9992dsm1103202pfb.123.2024.01.11.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 05:16:06 -0800 (PST)
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
	ebiggers@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v10, 00/10] riscv: support kernel-mode Vector
Date: Thu, 11 Jan 2024 13:15:48 +0000
Message-Id: <20240111131558.31211-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_051609_114575_FAD787D2 
X-CRM114-Status: GOOD (  20.66  )
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

VGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBydW5uaW5nIFZlY3RvciBpbiBrZXJuZWwgbW9k
ZS4KQWRkaXRpb25hbGx5LCBrZXJuZWwtbW9kZSBWZWN0b3IgY2FuIGJlIGNvbmZpZ3VyZWQgdG8g
cnVuIHdpdGhvdXQKdHVybm5pbmcgb2ZmIHByZWVtcHRpb24gb24gYSBDT05GSUdfUFJFRU1QVCBr
ZXJuZWwuIEFsb25nIHdpdGggdGhlCnN1cG9ydCwgd2UgYWRkIFZlY3RvciBvcHRpbWl6ZWQgY29w
eV97dG8sZnJvbX1fdXNlci4gQW5kIHByb3ZpZGUgYQpzaW1wbGUgdGhyZXNob2xkIHRvIGRlY2lk
ZSB3aGVuIHRvIHJ1biB0aGUgdmVjdG9yaXplZCBmdW5jdGlvbnMuCgpXZSBkZWNpZGVkIHRvIGRy
b3AgdmVjdG9yaXplZCBtZW1jcHkvbWVtc2V0L21lbW1vdmUgZm9yIHRoZSBtb21lbnQgZHVlCnRv
IHRoZSBjb25jZXJuIG9mIG1lbW9yeSBzaWRlLWVmZmVjdCBpbiBrZXJuZWxfdmVjdG9yX2JlZ2lu
KCkuIFRoZQpkZXRhaWxlZCBkZXNjcmlwdGlvbiBjYW4gYmUgZm91bmQgYXQgdjlbMV0KClRoaXMg
c2VyaWVzIGlzIGNvbXBvc2VkIGJ5IDQgcGFydHM6CiBwYXRjaCAxLTQ6IGFkZHMgYmFzaWMgc3Vw
cG9ydCBmb3Iga2VybmVsLW1vZGUgVmVjdG9yCiBwYXRjaCA1OiBpbmNsdWRlcyB2ZWN0b3JpemVk
IGNvcHlfe3RvLGZyb219X3VzZXIgaW50byB0aGUga2VybmVsCiBwYXRjaCA2OiByZWZhY3RvciBj
b250ZXh0IHN3aXRjaCBjb2RlIGluIGZwdSBbMl0KIHBhdGNoIDctMTA6IHByb3ZpZGVzIHNvbWUg
Y29kZSByZWZhY3RvcnMgYW5kIHN1cHBvcnQgZm9yIHByZWVtcHRpYmxlCiAgICAgICAgICAgICBr
ZXJuZWwtbW9kZSBWZWN0b3IuCgpUaGlzIHNlcmllcyBjYW4gYmUgbWVyZ2VkIGlmIHdlIGZlZWwg
YW55IHBhcnQgb2YgezF+NCwgNSwgNiwgN34xMH0gaXMKbWF0dXJlIGVub3VnaC4KClRoaXMgcGF0
Y2ggaXMgdGVzdGVkIG9uIGEgUUVNVSB3aXRoIFYgYW5kIHZlcmlmaWVkIHRoYXQgYm9vdGluZywg
bm9ybWFsCnVzZXJzcGFjZSBvcGVyYXRpb25zIGFsbCB3b3JrIGFzIHVzdWFsIHdpdGggdGhyZXNo
b2xkcyBzZXQgdG8gMC4gQWxzbywKd2UgdGVzdCBieSBsYXVuY2hpbmcgbXVsdGlwbGUga2VybmVs
IHRocmVhZHMgd2hpY2ggY29udGludW91c2x5IGV4ZWN1dGVzCmFuZCB2ZXJpZmllcyBWZWN0b3Ig
b3BlcmF0aW9ucyBpbiB0aGUgYmFja2dyb3VuZC4gVGhlIG1vZHVsZSB0aGF0IHRlc3RzCnRoZXNl
IG9wZXJhdGlvbiBpcyBleHBlY3RlZCB0byBiZSB1cHN0cmVhbSBsYXRlci4KCnY5IG9mIHRoaXMg
c2VyaWVzIGNhbiBiZSBmb3VuZCBhdCBbMV0KClsxXTpodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMzEyMjkxNDM2MjcuMjI4OTgtMS1hbmR5LmNoaXVAc2lmaXZlLmNvbS8KClBhdGNoIHN1
bW1hcnk6CiAtIFVwZGF0ZWQgcGF0Y2hlczogMSwgNSwgMTAKIC0gTmV3IHBhdGNoOiAobm9uZSkK
IC0gVW5jaGFuZ2VkIHBhdGNoOiAyLCAzLCA0LCA2LCA3LCA4LCA5CiAtIERlbGV0ZWQgcGF0Y2g6
IChub25lKQoKQ2hhbmdlbG9nIHYxMDoKIC0gUmVmYWN0b3IgY29tbWVudHMgKDEpLCBFcmljCiAt
IFJlbW92ZSBkdXBsaWNhdGUgYXNzZW1ibHkgY29kZSAoNSksIENoYXJsaWUKIC0gT3B0aW1pemUg
dW5uZWNlc3NhcnkgY29tcGlsZXIgYmFycmllcnMgaW4gcHJlZW1wdF92ICgxMCkKIC0gQWRkcmVz
cyBidWdzIGluIGNvbnRleHQtc2F2aW5nIGZvciBwcmVlbXB0X3YgKDEwKQogLSBDb3JyZWN0IGRp
cnR5IG1hcmtpbmcvY2xlYXJpbmcgY29kZSBmb3IgcHJlZW1wdF92ICgxMCkKCkNoYW5nZWxvZyB2
OToKIC0gVXNlIG9uZSBiaXQgdG8gcmVjb3JkIHRoZSBvbi9vZmYgc3RhdHVzIG9mIGtlcm5lbC1t
b2RlIFZlY3RvcgogLSBUZW1wb3JhcmlseSBkcm9wIHZlY3Rvcml6ZWQgbWVtKiBmdW5jdGlvbnMK
IC0gQWRkIGEgcGF0Y2ggdG8gcmVmYWN0b3IgY29udGV4dCBzd2l0Y2ggaW4gZnB1CiAtIHNpbGVu
Y2UgbG9ja2RlcCBhbmQgdXNlIFdBUk5fT04gaW5zdGVhZAoKQ2hhbmdlbG9nIHY4OgogLSBBZGRy
ZXNzIGJ1aWxkIGZhaWwgb24gbm8tbW11IGNvbmZpZwogLSBGaXggYnVpbGQgZmFpbCB3aXRoIFc9
MQogLSBSZWZhY3RvciBwYXRjaGVzICgxLCAyKSwgRXJpYwoKQ2hhbmdlbG9nIHY3OgogLSBGaXgg
YnVpbGQgZmFpbCBmb3IgYWxsbW9kY29uZmlnIGFuZCB0ZXN0IGJ1aWxkaW5nIHRoZSBzZXJpZXMg
d2l0aAogICBhbGxtb2Rjb25maWcvYWxseWVzY29uZmlnCgpDaGFuZ2Vsb2cgdjY6CiAtIFByb3Zp
ZGUgYSBtb3JlIHJvYnVzdCBjaGVjayBvbiB0aGUgdXNlIG9mIG5vbi1wcmVlbXB0aWJsZSBWZWN0
b3IuCiAtIEFkZCBLY29uZmlncyB0byBzZXQgdGhyZXNob2xkIHZhbHVlIGF0IGNvbXBpbGUgdGlt
ZS4gKENoYXJsaWUpCiAtIEFkZCBhIHBhdGNoIHRvIHV0aWxpemUga21lbV9jYWNoZV8qIGZvciBW
IGNvbnRleHQgYWxsb2NhdGlvbnMuCiAtIFJlLXdyaXRlIGFuZCBhZGQgcHJlZW1wdGlibGUgVmVj
dG9yLgoKQ2hhbmdlbG9nIHY1OgogLSBSZWJhc2Ugb24gdG9wIG9mIHJpc2N2IGZvci1uZXh0ICg2
LjctcmMxKQpDaGFuZ2Vsb2cgdjQ6CiAtIFVzZSBrZXJuZWxfdl9mbGFncyBhbmQgaGVscGVycyB0
byB0cmFjayB2ZWN0b3IgY29udGV4dC4KIC0gUHJldmVudCBzb2Z0aXJxIGZyb20gbmVzdGluZyBW
IGNvbnRleHQgZm9yIG5vbi1wcmVlbXB0IFYKIC0gQWRkIHVzZXIgY29weSBhbmQgbWVtKiByb3V0
aW5lcwoKQ2hhbmdlbG9nIHYzOgogLSBSZWJhc2Ugb24gdG9wIG9mIHJpc2N2IGZvci1uZXh0ICg2
LjYtcmMxKQogLSBGaXggYSBidWlsZCBpc3N1ZSAoQ29ub3IpCiAtIEd1YXJkIHZzdGF0ZV9zYXZl
LCB2c3RhdGVfcmVzdG9yZSB3aXRoIHtnZXQscHV0fV9jcHVfdmVjdG9yX2NvbnRleHQuCiAtIFNh
dmUgViBjb250ZXh0IGFmdGVyIGRpc2FibGluZyBwcmVlbXB0aW9uLiAoR3VvKQogLSBSZW1vdmUg
aXJxc19kaXNhYmxlZCgpIGNoZWNrIGZyb20gbWF5X3VzZV9zaW1kKCkuIChCasO2cm4pCiAtIENv
bW1lbnQgYWJvdXQgbmVzdGluZyBWIGNvbnRleHQuCgpDaGFuZ2Vsb2cgdjI6CiAtIGZpeCBidWls
ZCBpc3N1ZXMKIC0gRm9sbG93IGFybSdzIHdheSBvZiBzdGFydGluZyBrZXJuZWwtbW9kZSBzaW1k
IGNvZGU6CiAgIC0gYWRkIGluY2x1ZGUvYXNtL3NpbWQuaCBhbmQgcmVuYW1lIG1heV91c2VfdmVj
dG9yKCkgLT4KICAgICBtYXlfdXNlX3NpbWQoKQogICAtIHJldHVybiB2b2lkIGluIGtlcm5lbF92
ZWN0b3JfYmVnaW4oKSwgYW5kIEJVR19PTiBpZiBtYXlfdXNlX3NpbWQoKQogICAgIGZhaWxzCiAt
IENoYW5nZSBuYW1pbmcgc2NoZW1lIGZvciBmdW5jdGlvbnMvbWFjcm9zIChDb25vcik6CiAgIC0g
cmVtb3ZlIEtNVgogICAtICdzL3J2di92ZWN0b3IvJwogICAtICdzL1JJU0NWX0lTQV9WX1BSRUVN
UFRJVkVfS01WL1JJU0NWX0lTQV9WX1BSRUVNUFRJVkUvJwogICAtICdzL1RJRl9SSVNDVl9WX0tN
Vi9USUZfUklTQ1ZfVl9LRVJORUxfTU9ERS8nCgpBbmR5IENoaXUgKDgpOgogIHJpc2N2OiB2ZWN0
b3I6IG1ha2UgVmVjdG9yIGFsd2F5cyBhdmFpbGFibGUgZm9yIHNvZnRpcnEgY29udGV4dAogIHJp
c2N2OiBzY2hlZDogZGVmZXIgcmVzdG9yaW5nIFZlY3RvciBjb250ZXh0IGZvciB1c2VyCiAgcmlz
Y3Y6IGxpYjogdmVjdG9yaXplIGNvcHlfdG9fdXNlci9jb3B5X2Zyb21fdXNlcgogIHJpc2N2OiBm
cHU6IGRyb3AgU1JfU0QgYml0IGNoZWNraW5nCiAgcmlzY3Y6IHZlY3RvcjogZG8gbm90IHBhc3Mg
dGFza19zdHJ1Y3QgaW50bwogICAgcmlzY3Zfdl92c3RhdGVfe3NhdmUscmVzdG9yZX0oKQogIHJp
c2N2OiB2ZWN0b3I6IHVzZSBhIG1hc2sgdG8gd3JpdGUgdnN0YXRlX2N0cmwKICByaXNjdjogdmVj
dG9yOiB1c2Uga21lbV9jYWNoZSB0byBtYW5hZ2UgdmVjdG9yIGNvbnRleHQKICByaXNjdjogdmVj
dG9yOiBhbGxvdyBrZXJuZWwtbW9kZSBWZWN0b3Igd2l0aCBwcmVlbXB0aW9uCgpHcmVlbnRpbWUg
SHUgKDIpOgogIHJpc2N2OiBBZGQgc3VwcG9ydCBmb3Iga2VybmVsIG1vZGUgdmVjdG9yCiAgcmlz
Y3Y6IEFkZCB2ZWN0b3IgZXh0ZW5zaW9uIFhPUiBpbXBsZW1lbnRhdGlvbgoKIGFyY2gvcmlzY3Yv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAyMiArKysKIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYXNtLXByb3RvdHlwZXMuaCB8ICAyNyArKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZW50cnktY29tbW9uLmggICB8ICAxNyArKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNz
b3IuaCAgICAgIHwgIDQxICsrKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2ltZC5oICAgICAg
ICAgICB8ICA2NCArKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggICAg
ICB8ICAgMyArLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oICAgIHwgICAy
ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggICAgICAgICB8ICA5MCArKysrKysr
LS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmggICAgICAgICAgICB8ICA2OCArKysrKysr
CiBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9y
aXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgICAgICAgIHwgICA4ICsKIGFyY2gvcmlzY3Yva2Vy
bmVsL2tlcm5lbF9tb2RlX3ZlY3Rvci5jICB8IDI0NyArKysrKysrKysrKysrKysrKysrKysrKysK
IGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICAgICB8ICAxMyArLQogYXJjaC9y
aXNjdi9rZXJuZWwvcHRyYWNlLmMgICAgICAgICAgICAgIHwgICA3ICstCiBhcmNoL3Jpc2N2L2tl
cm5lbC9zaWduYWwuYyAgICAgICAgICAgICAgfCAgIDcgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3Zl
Y3Rvci5jICAgICAgICAgICAgICB8ICA1MCArKysrLQogYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgIHwgICA3ICstCiBhcmNoL3Jpc2N2L2xpYi9yaXNjdl92X2hlbHBlcnMu
YyAgICAgICAgfCAgNDQgKysrKysKIGFyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUyAgICAgICAgICAg
ICAgICB8ICAxMCArCiBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzX3ZlY3Rvci5TICAgICAgICAgfCAg
NDQgKysrKysKIGFyY2gvcmlzY3YvbGliL3hvci5TICAgICAgICAgICAgICAgICAgICB8ICA4MSAr
KysrKysrKwogMjEgZmlsZXMgY2hhbmdlZCwgODI1IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2ltZC5oCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS94b3IuaAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2tlcm5lbF9tb2RlX3ZlY3Rvci5jCiBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIvcmlzY3Zfdl9oZWxwZXJzLmMKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzX3ZlY3Rvci5TCiBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9saWIveG9yLlMKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
