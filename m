Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99717C04FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 18 May 2024 02:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Px0FhFxtAXw5JWFID4r2ODn2U6YfnWlDcyLss0nf9+I=; b=mYz1MHakewgl36
	akTZXUTHBHr8AWD+ryhSuzLjL/54Ec8S/nrxX9zPYNTUbcgoVMlhCtclrhoHEw3FcrVb4gplbqZqo
	RQY8YeWECkjsl4bAS4CO+ihlGhfYJv78/inharZag+kA4M/duMa0BU5SPJF9sW4ol3cvdu95sj26K
	cs1CWafUgY1znrm/EvBOl3LULw3zLWwJBQY1XjnMD7rI+p+HC05VNUitbPszxhT8WBe4o2c9D0PJI
	LTVcC6kvC3l2nUTXQj6SutlhxTHZl89RPFGbsgadrAh1f66bfy7+IkA+ockqh4njuE7pzy/HAnrmu
	NK39JZ6uxQI/MrfZuKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s89Pj-00000009PHb-2Sfa;
	Sat, 18 May 2024 02:03:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s89Pf-00000009PG7-1R8r
	for linux-riscv@lists.infradead.org;
	Sat, 18 May 2024 02:03:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1edfc57ac0cso25936595ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 19:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715997779; x=1716602579; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VzjGIlFVE04M/i0f0p58J/2gnZ8w0Gtcle/CsEoCqZw=;
        b=VFhUzADAm5Vo448zJpcNuCBmx6C2pEnAcwXN/JLBs3UncjJCNorjjpLooEsUMNhCev
         R8wJDntMom2IzVkzUMK9OFNqZqbhWLsukwg1YoIW4Oe0BZ6tdCkUQLwJROiaLK5he4tu
         rtN96+AUV3p/y1YlEwaysrz74KScJoFke4ad8aGS68jTsO5D/agGFaBTNMCk9aQkhNzc
         3XZg/m5rfNJnI3dYD4NjhGCJAdwQb6pKLUSNpmuxd2a2oRHm76gyzvS8oy2MjNQ39nfH
         B/vx08ua70u5/nQWsxKwgi6f7ixveqx3psIG2iBxiIy/vPuvHtnRIDD+ZtJGGyKa9smh
         E67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715997779; x=1716602579;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzjGIlFVE04M/i0f0p58J/2gnZ8w0Gtcle/CsEoCqZw=;
        b=QKQDxxLZ5ONUCCIj18VP9OL35tWb43ndBNKWRam2EcKJjp4YwAzVsvc68j8XcbXvV+
         D0ZIFHK3igaiKvj8W+EymExcCvO2dSitqhy89Qust1B6udAoocyk/H4ANTvpT2bKNfzQ
         SU8zQQ81w5+dHu5bk70UKE4ma+4oktkNehTh77TIFinkLXOt6CauyrbzkehzoUX3T/NQ
         oI9/5ojtsrCpLr+8+lR23df1dHTEHVCHS+28CWaZMdN2c6AkcK1AndzNg56WwpOOFUmH
         y7pVBNRLVTWIuE288FIkMcoSTaBUMBZHRgAwO8iDTAsXf3LFNBBVaVu1KkxJuwInBboQ
         zGCw==
X-Forwarded-Encrypted: i=1; AJvYcCXUa7pTTeJ1E6LthyHFs8/1YXx+XbUD0NAbEcwEteFgENzSFC7CYzVGZcN/AS/oTaZoiHqVOjHwlE3vLdNaLLn8Yz5uKEGGQeSJa1kVGsEe
X-Gm-Message-State: AOJu0Yx7q0kEGf8B6esF5ucm9xaAlb+fGAeFRP9v+6AnsFKbyDRjJXAI
	E1tFH3oQKm4NnQy8ahc5XPlXXspZK2N6Pcaxrb/3WRft1ucehEyOR6nWLqNY4cT2uq4hfLGgeVl
	WvEQ=
X-Google-Smtp-Source: AGHT+IFC6v8gebAID8M6V/rPXFbKf6e2Y+CsiWRFUg9yZPayzREsbVpGa1/fLOk23BC2R+2oLQH/RQ==
X-Received: by 2002:a17:903:41d0:b0:1ec:c6d1:8950 with SMTP id d9443c01a7336-1ef4404b5d3mr287886105ad.63.1715997778634;
        Fri, 17 May 2024 19:02:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c256429sm162535135ad.291.2024.05.17.19.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 19:02:58 -0700 (PDT)
Message-ID: <66480c52.170a0220.f89d3.aabd@mx.google.com>
Date: Fri, 17 May 2024 19:02:58 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-rc1-50-g92cce91949a49
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (v6.9-rc1-50-g92cce91949a49)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_190307_618494_F0F691E9 
X-CRM114-Status: UNSURE (   3.61  )
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
cmMxLTUwLWc5MmNjZTkxOTQ5YTQ5KQoKVGhpcyBsZWdhY3kgS2VybmVsQ0kgcHJvdmlkaW5nIHRo
aXMgcmVwb3J0IHdpbGwgc2h1dGRvd24gc29tZXRpbWUKc29vbiBpbiBmYXZvciBvZiBvdXIgbmV3
IEtlcm5lbENJIGluZnJhLiBOb3QgYWxsIHRlc3RzIGFyZSBiZWluZwptaWdyYXRlZC4KSWYgeW91
IGFyZSBzdGlsbCB1c2luZyB0aGlzIHJlcG9ydCBhbmQgd2FudCB1cyB0byBwcmlvcml0aXplIHlv
dXIKdXNlY2FzZSBpbiB0aGUgbmV3IHN5c3RlbSwgcGxlYXNlIGxldCB1cyBrbm93IGF0Cmtlcm5l
bGNpQGxpc3RzLmxpbnV4LmRldgoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNp
Lm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVsL3Y2LjktcmMxLTUwLWc5MmNj
ZTkxOTQ5YTQ5LwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHY2
LjktcmMxLTUwLWc5MmNjZTkxOTQ5YTQ5CkdpdCBDb21taXQ6IDkyY2NlOTE5NDlhNDk3YThhNDYx
NWY5YmE1ODEzYjAzZjdhMWYxZDUKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
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
b25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAw
IHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9z
ZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2Fy
bmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8
aW5mb0BrZXJuZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
