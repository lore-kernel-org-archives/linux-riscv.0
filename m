Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30478EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 21:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NYtZifkg9EA7Xv7IHm/27lYiv4nll/aMnlHGxICPiWY=; b=NtRZaNgmr0luboyJp1fiPZ05Yi
	o8xLWuypUoWl5mKfFCDBcfHk7+X7Lika6deKsPDgeOoUH0XBIO4lR8SGh9KyMHaJ1gKN21cFLTawe
	V+C0zixhqOS6AcniC0m/k4AXDzDemKT+MEyISnucbVF4YN2wXvfXTw6K30wJ3LvxHqtwb+eWXZ8Oe
	2Cirvm3MdtRKyTG2gr2eQ2KBqVE8tUMnkyWCXLeBL2ZUGyKQdNZwbez3J2oFtAcxrLaUml9VzurOH
	+4svkxsPDhvn8NyrCVeFUcbKYOZ2V+tjUX5GG9RRRSa0j6Ff3o0Xgg18Od2IeFFlz6fZewjDFkzq6
	6G4kCYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWoT-002lTB-06;
	Thu, 06 Jul 2023 21:46:57 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWoP-002lRh-3A
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 21:46:55 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-55b22f82ac8so1615198a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 14:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688680011; x=1691272011;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNi/IufnbMEMmIYXZ/wf1/LO6krGFVyjl9tQSF72+B0=;
        b=M1oTkO5RyIT5ONpZYq4JUC5F0qKdwhTZn89dRhbPUjuqUzgfQx3rO1RmjmOzD0eX5Q
         0sAj2Wadr8WsQivNN3bz8SKMgPN7yVS6JI/T1ien1zjqMZQ8sCeWjNCuQFtN3HJc1hXO
         qnyLwwE5BCXWOlNU5kOZFarqJr/+4+b1JG016/C2gwNU7EuSGuSMMOEFXfPlfJ/1i/Hg
         1jHGIoZkSHRez+oZLhA4YNs1+wIuzTsXxtJH/KtwaHhH258jm2OvKEyO6UZDSStklzR0
         32l4evn9EjFn9N0/X3TWCuZY9zmGzyQHJfYq+WVGdasOSEaWQ1OafcKS44aDXVVZX8Ci
         rVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688680011; x=1691272011;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNi/IufnbMEMmIYXZ/wf1/LO6krGFVyjl9tQSF72+B0=;
        b=Dg5enpAswUcdU+TeBBxdS+7zyOyvqCfAHDPuA/afSjWJyGYBzdWM8Xx1onGrDMf11t
         kRso+bsuqrf5qwuYwoYy6atY+5fblqr4azFWEr/d2yRenr4c+vutn4rGSMCl3yR/ZMVi
         SUs4w7WyxpU4dnKT84pU2ciK7RdsMFoNdFmQGYRS3+YTZCY35jTq1jpj3RrZgQCDi6ZG
         yZHk6NRa3qMlzwpFpACq4fp9I9B9L/Oh0+jmIImnRmjsSN8F+ozspW4BxLCPYfjkOrpr
         V5vdDYT88zj/yjOThdv7jh0vDvJOEX3yhryP4wlhhpf62XTTchLEXN1X4amHSTiK1spV
         AlfQ==
X-Gm-Message-State: ABy/qLb3uu4JdiDzuhqj66WWXUbDc60+sBH9q3/JnT73OEGTMtQJmDEv
	M+EwSioGBT3uMHMXkikIWNSiIQ==
X-Google-Smtp-Source: APBJJlF+X0KmiIKjuZDmk5537yorVa9KnlcKxVe3cLUx4XTg7EFQ0d9PIZTElsyekXpylROYbY9gFA==
X-Received: by 2002:a17:903:446:b0:1b6:783d:9ba7 with SMTP id iw6-20020a170903044600b001b6783d9ba7mr4241983plb.27.1688680011289;
        Thu, 06 Jul 2023 14:46:51 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b001b84cd8814bsm1849090pls.65.2023.07.06.14.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:46:50 -0700 (PDT)
Date: Thu, 06 Jul 2023 14:46:50 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 14:46:00 PDT (-0700)
Subject: Re: linux-next: Tree for Jul 6 (arch/riscv/)
In-Reply-To: <62e993a5-0bb4-40dc-6399-f60525300a6c@infradead.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-6e5d4a84-8aef-406d-b0cd-8f195f531354@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_144654_018800_48864069 
X-CRM114-Status: GOOD (  17.82  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwNiBKdWwgMjAyMyAxNDozNjowNSBQRFQgKC0wNzAwKSwgcmR1bmxhcEBpbmZyYWRl
YWQub3JnIHdyb3RlOgo+Cj4KPiBPbiA3LzYvMjMgMTQ6MzIsIFBhbG1lciBEYWJiZWx0IHdyb3Rl
Ogo+PiBPbiBUaHUsIDA2IEp1bCAyMDIzIDE0OjI3OjUzIFBEVCAoLTA3MDApLCByZHVubGFwQGlu
ZnJhZGVhZC5vcmcgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDcvNS8yMyAxODo1NywgU3RlcGhlbiBS
b3Rod2VsbCB3cm90ZToKPj4+PiBIaSBhbGwsCj4+Pj4KPj4+PiBQbGVhc2UgZG8gKm5vdCogYWRk
IGFueSB2Ni42IHJlbGF0ZWQgc3R1ZmYgdG8geW91ciBsaW51eC1uZXh0IGluY2x1ZGVkCj4+Pj4g
YnJhbmNoZXMgdW50aWwgYWZ0ZXIgdjYuNS1yYzEgaGFzIGJlZW4gcmVsZWFzZWQuCj4+Pj4KPj4+
PiBDaGFuZ2VzIHNpbmNlIDIwMjMwNzA1Ogo+Pj4+Cj4+Pgo+Pj4gb24gcmlzY3Y2NDoKPj4+Cj4+
PiBXQVJOSU5HOiBtb2Rwb3N0OiB2bWxpbnV4OiBzZWN0aW9uIG1pc21hdGNoIGluIHJlZmVyZW5j
ZTogJHhydjY0aTJwMV9tMnAwX2EycDFfemljc3IycDBfemlmZW5jZWkycDBfemloaW50cGF1c2Uy
cDBfem1tdWwxcDArMHgxNCAoc2VjdGlvbjogLnRleHQudW5saWtlbHkuc2V0X2JpdC5jb25zdHBy
b3AuMCkgLT4gbnVtYV9ub2Rlc19wYXJzZWQgKHNlY3Rpb246IC5pbml0LmRhdGEpCj4+Pgo+Pj4K
Pj4+IEZ1bGwgcmFuZGNvbmZpZyBmaWxlIGlzIGF0dGFjaGVkLgo+Pgo+PiBUaGFua3MsIEknbSBn
aXZpbmcgaXQgYSBsb29rLsKgIERvIHlvdSBoYXBwZW4gdG8gYWxzbyBoYXZlIHlvdXIgdG9vbGNo
YWluIHZlcnNpb24gZWFzaWx5IGF2YWlsaWFibGU/wqAgVGhlIG1hcHBpbmcgc3ltYm9scyBhcmUg
bmV3IGFuZCB3ZSd2ZSBzZWVuIHNvbWUgb2RkIHN0dWZmIGhhcHBlbiwgc29tZXRoaW5nIGlzIGxp
a2VseSBicm9rZW4gc29tZXdoZXJlLi4uCj4KPiBJJ20gdXNpbmcgZ2NjLTEzLjEuMCBmcm9tICBo
dHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi90b29scy9jcm9zc3Rvb2wvCgpDb29s
LCB0aG9zZSBhcmUgcHJldHR5IGVhc3kgdG8gcnVuLiAgSSd2ZSB5ZXQgdG8gYWN0dWFsbHkgcmVw
cm9kdWNlIHRoZQpmYWlsdXJlcywgYnV0IEknZCBndWVzcyB3ZSBqdXN0IHdhbnQgdG8gaWdub3Jl
IHRoZSBtYXBwaW5nIHN5bWJvbHMgd2l0aApzb21ldGhpbmcgbGlrZQoKZGlmZiAtLWdpdCBhL3Nj
cmlwdHMvbW9kL21vZHBvc3QuYyBiL3NjcmlwdHMvbW9kL21vZHBvc3QuYwppbmRleCBiMjliMjk3
MDdmMTAuLjJmODAxNDY5MzAxZCAxMDA2NDQKLS0tIGEvc2NyaXB0cy9tb2QvbW9kcG9zdC5jCisr
KyBiL3NjcmlwdHMvbW9kL21vZHBvc3QuYwpAQCAtNjE0LDYgKzYxNCwxOCBAQCBzdGF0aWMgaW50
IGlnbm9yZV91bmRlZl9zeW1ib2woc3RydWN0IGVsZl9pbmZvICppbmZvLCBjb25zdCBjaGFyICpz
eW1uYW1lKQogCQkvKiBFeHBvbGluZSB0aHVua3MgYXJlIGxpbmtlZCBvbiBhbGwga2VybmVsIG1v
ZHVsZXMgZHVyaW5nIGZpbmFsIGxpbmsgb2YgLmtvICovCiAJCWlmIChzdHJzdGFydHMoc3ltbmFt
ZSwgIl9fczM5MF9pbmRpcmVjdF9qdW1wX3IiKSkKIAkJCXJldHVybiAxOworCisJLyoKKwkgKiBS
SVNDLVYgZGVmaW5lcyB2YXJpb3VzIHNwZWNpYWwgc3ltYm9scyB0aGF0IHN0YXJ0IHdpdGggIiQi
LiAgVGhlCisJICogbWFwcGluZyBzeW1ib2xzLCB3aGljaCBleGlzdCB0byBkaWZmZXJlbnRpYXRl
IGJldHdlZW4gaW5jb21wYXRpYmxlCisJICogaW5zdHJ1Y3Rpb24gZW5jb2RpbmdzIHdoZW4gZGlz
YXNzZW1ibGluZywgc2hvdyB1cCBhbGwgb3ZlciB0aGUgcGxhY2UKKwkgKiBhbmQgYXJlIGdlbmVy
YWxseSBub3QgbWVhbnQgdG8gYmUgdHJlYXRlZCBsaWtlIG90aGVyIHN5bWJvbHMuICBTbworCSAq
IGp1c3QgaWdub3JlIGFueSBvZiB0aGUgc3BlY2lhbCBzeW1ib2xzLgorCSAqLworCWlmIChpbmZv
LT5oZHItPmVfbWFjaGluZSA9PSBFTV9SSVNDVikKKwkJaWYgKHN5bW5hbWVbMF0gPT0gJyQnKQor
CQkJcmV0dXJuIDE7CisKIAkvKiBEbyBub3QgaWdub3JlIHRoaXMgc3ltYm9sICovCiAJcmV0dXJu
IDA7CiB9CgpJIGhhdmVuJ3QgZXZlbiBidWlsdCB0aGF0LCB0aG91Z2guLi4KClRoZXNlIGFsc28g
dHJpcCB1cCBiYWNrdHJhY2VzLCBzbyB3ZSBwcm9iYWJseSBuZWVkIHNvbWV0aGluZyBvdmVyIHRo
ZXJlIGFzCndlbGwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
