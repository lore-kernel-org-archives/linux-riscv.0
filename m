Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6531C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 19:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bfGOiLbPdGZsTlbSl79xJPIDeLL+QGq1t8hztDQrCrM=; b=drz+DoCkwg86lO
	X9qwNWszS+XJZJNCqv25XLQdBCoSsa3Fjlnt9cpWgQQlSwwNWneqGLwntu7llOj5UjhR1nYOGCFS8
	EeCSJEdets04uSpwOIbbWo5frwbO5gadVK7fMqmZOccjpPkiC6za2/OCcphlUB7PrYkUp0glbrfd+
	xikQr50/YHCCQ4/KEgf9zJjVLjHvLv/fvcr3FR6+9NfPFD3L2wRpQxsAw5vOjLe0O8vYn6xDhhEm7
	HqfvOqAhmwVRelTx8oJ4dyFq+ESF76bU7H4Xt7kGtKgOzfVm6h9QAgtUA75F8G/GOA4toTPPY2Ws1
	i2iH1qaan1qhVkRwozkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7K7a-00000002gIS-3NyB;
	Wed, 15 May 2024 19:17:02 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7K7X-00000002gHV-1sdq
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 19:17:01 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5ce2aada130so5154477a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715800615; x=1716405415; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iwBhXqFhdndFwCXOh7VwgywUGwxatxIM6QkOO/xHnLA=;
        b=jU/BCWSmK+ngIMbBtrl05o1WAM0IE4hvc1J2IDwv6UBBVfI7qByOPSiIYex9YHlo7J
         lzOZF/h39ZYNd7WmHnhzRztgvwuDYLlf31riAGprOv8fO+UjjoZFjFnRfB/pJrc4sGQn
         ZUY78mvLdsZFBaZs/YVR0uYN22Dfnj59HS4hG5Q3Ktbthw2Dzh8bGTJEeObp6t5j0+HN
         KOAb8dxg8u6oEvXdL7jd77vAdaDDO/68nywYU/68F6sn3X0E9efVQpqxr2/bSj6kbIkB
         dAs7RUCoFmXZEco0AVNF+eUVKorGs5a0nvs+korbIWRUZJyhDHbVTV6EmJtIDqJR+pfn
         RvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715800615; x=1716405415;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwBhXqFhdndFwCXOh7VwgywUGwxatxIM6QkOO/xHnLA=;
        b=fbAdXxhLd8WqGIgHLzKcCBcDq8RDE3T7z23Yj0z4418tw3P736rplTJa8QtyRvVOY6
         q1QgIJ9OCyE6gHMFOkR0xn49ILLhdGr1lnZaFMn2MaHP3bzC82f8yfPPGWxDtaAbrd9W
         KotnSETO+1/XQY65p1WrbqQxbGm9Lyxag3dcnHhdrubbn4WBB8vsEI0rZgBF3URVglSt
         1tOGPxe9p3iFdiQSPLzaSkdUXhoEQngnUHgs8VULzXxiGDKfGW2fSkCQ8V+YrM2iRq5z
         S1QD/2LfjxYQeyRQYqgjSYWcvNE/MYJwLBuMvePUNRoZqBnZvLTDkc2vKQq/IpItNFt+
         fW1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWk41YIjd0w3VqU+q0C+YqK/wvlBTiUnIYlt0u2UDIxjnsYmWiDjKqA5jDEx4wxNxR8iRTlXlZRHrPgPpIC3QVY/6qlUcORunKEQLbABTbU
X-Gm-Message-State: AOJu0Yxuw1DKRhLw1zJzdlytNI67iG31N5ihNXt6vLbPsSvPd9IguKgV
	9TcJYazaHECDXWajhV5WTBRnMS0l8wzQi52N9exV9IdfwmCj6odyrP29wM5yrng=
X-Google-Smtp-Source: AGHT+IECJ+7u4FUdkkOfc6Y/+HujPjCcdi5kIeKmpRRxuQCbbbvrDxMPdy/fNSK2P6SdvIHAC8zKXw==
X-Received: by 2002:a17:90b:37cb:b0:2b0:e3b3:78c2 with SMTP id 98e67ed59e1d1-2b6ccd8e08dmr14387106a91.48.1715800614837;
        Wed, 15 May 2024 12:16:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a265sm13931015a91.10.2024.05.15.12.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 12:16:54 -0700 (PDT)
Message-ID: <66450a26.170a0220.ef8cc.4ccc@mx.google.com>
Date: Wed, 15 May 2024 12:16:54 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-rc1-61-g5e3964ba8400a
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (v6.9-rc1-61-g5e3964ba8400a)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_121659_513865_ABE39FDB 
X-CRM114-Status: UNSURE (   3.92  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQgKHY2Ljkt
cmMxLTYxLWc1ZTM5NjRiYTg0MDBhKQoKVGhpcyBsZWdhY3kgS2VybmVsQ0kgcHJvdmlkaW5nIHRo
aXMgcmVwb3J0IHdpbGwgc2h1dGRvd24gc29tZXRpbWUKc29vbiBpbiBmYXZvciBvZiBvdXIgbmV3
IEtlcm5lbENJIGluZnJhLiBOb3QgYWxsIHRlc3RzIGFyZSBiZWluZwptaWdyYXRlZC4KSWYgeW91
IGFyZSBzdGlsbCB1c2luZyB0aGlzIHJlcG9ydCBhbmQgd2FudCB1cyB0byBwcmlvcml0aXplIHlv
dXIKdXNlY2FzZSBpbiB0aGUgbmV3IHN5c3RlbSwgcGxlYXNlIGxldCB1cyBrbm93IGF0Cmtlcm5l
bGNpQGxpc3RzLmxpbnV4LmRldgoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNp
Lm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVsL3Y2LjktcmMxLTYxLWc1ZTM5
NjRiYTg0MDBhLwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHY2
LjktcmMxLTYxLWc1ZTM5NjRiYTg0MDBhCkdpdCBDb21taXQ6IDVlMzk2NGJhODQwMGFmYWUyODNh
NGQ2MWIzMzY4MGRhYjFmODViMTIKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNo
aXRlY3R1cmUKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmln
IGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2
LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2
KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgZ2Nj
LTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwg
Y2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNj
diwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNt
YXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlz
Y3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBt
aXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZj
b25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBz
ZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2Rj
YXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2Fy
bmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8
aW5mb0BrZXJuZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
