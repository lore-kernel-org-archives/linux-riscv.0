Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452FCC04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZEt97bKktX4eFRplnoecN00o1ryQ78u0ISce8Ad52A=; b=XLspP+wAB2ie1k
	coVmR6gD/AM0I4d4plEtdu5TfwP80hz2+CBPTcDUNN9C9/p2Rmr39uiVbxiF+6yHZKrI1Cqm6/ZG9
	J6iYDRPUwGxstR1DiIqXqwRB5Gjpzucb8pIWYgtrtwTNdWowoSzP1X+2wkYkV+5t9YTBii/QnTvY1
	HmwEihT/4/oUY8TMAOBeVBmL43hHBNsseueM8x+mV7gS8iHRvOpkB+zL7IE04QqjqxXTGeIfK2O5S
	p42IL6fasVrcMhFOQvgZvdrPBDfkzwyp4MNzf8rO0/Xy6ufLeAMnM4KvxHIrcmvWYJ5X3gKsmXixB
	5nW3GB8Kx+pig+NVV9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1Z-00A6cb-09;
	Thu, 03 Aug 2023 15:14:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1R-00A6TB-1x
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:13:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686fc0d3c92so749612b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691075631; x=1691680431;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+a2fB54AlyWkzUEDuBDciIZSmupcAmDbViWZx3iiKns=;
        b=Ia16/ollXxBwMbhUVSz6hrN1tzd3JyT9/2JfyDWqgU811+gqlY2/F4J61JC5EvCmui
         A5diJaWmzz0zpBQIJhvmum3sz+EmiFTCz9CI5nCYorYmWtKYoiFDs/odDi0QI3S+2/R3
         1B5dMWtoqJDTScq0i6GhqmVryrks7vHhEDz17rWrQCpuIYcEYV69peyUjAKxvnrqnqra
         FDDSvBA1edVKuGCjMkgOmmqdi/MsJvjKYisoBApyRESUgn8Jl9eabBXcl8eDVt8qE0WT
         oAKuNEd6CZ1rldGMm6us9LM5dPZZm/bINtvp0r+ssEuAnQmKF4TazYbtaQDBo0Gh1sQL
         fy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691075631; x=1691680431;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a2fB54AlyWkzUEDuBDciIZSmupcAmDbViWZx3iiKns=;
        b=Xv50spa+R0j3+GIZ2yAi9mQk8+eGSZOElHb3GJjawyWMZqYPfmSbdCr/LuL7uEVxiH
         x6jOXS2rIKL7sCCvhN6yE69itp2kbT8agvYX8qp+3qmpUJpK0hXEg4m9sZ1eTZ/v+64p
         wqgpr4qBmfJU/pumMpcqGpgHvKb/qLdXYKXIK3K8Ukqdy8247xT8zCTf27D1wXueb92u
         CYWJ8r+NEzRglHxGJOJO9T4yN6hFqSxvi/5AGJdvP+vq2OOYkmhDkoC3Tp7mpiVlqHlL
         CUmKA0N7OG4aSdgHFpmUJvLiOetuGbG4c5i8pKSJ5lSTctqsqHbkGN+bGiJ1TKS8WzVj
         wcrg==
X-Gm-Message-State: ABy/qLYPimfXzRH1w4lKCIF53iYGvMNRlDMEgBOtOBEc1zromzUm1U0g
	C7pHSYdzsf/7CjhRk/4GOmABNg==
X-Google-Smtp-Source: APBJJlFXAXyW8unSJ5ZlFzseZ1bjrOQHVX7phAzP8V10iSKpxZee3WmCWxSSSr3wjOFSUnrA5p1HQg==
X-Received: by 2002:a05:6a00:b8f:b0:687:472f:514a with SMTP id g15-20020a056a000b8f00b00687472f514amr11383383pfj.2.1691075631160;
        Thu, 03 Aug 2023 08:13:51 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id v13-20020a62a50d000000b0066ebaeb149dsm7176947pfm.88.2023.08.03.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 08:13:50 -0700 (PDT)
In-Reply-To: <20230713115829.110421-1-alexghiti@rivosinc.com>
References: <20230713115829.110421-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH] selftests: riscv: Fix compilation error with
 vstate_exec_nolibc.c
Message-Id: <169107392503.27633.2191837906397435034.b4-ty@rivosinc.com>
Date: Thu, 03 Aug 2023 07:45:25 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
  linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_081353_654564_07A5BA3D 
X-CRM114-Status: UNSURE (   7.63  )
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

Ck9uIFRodSwgMTMgSnVsIDIwMjMgMTM6NTg6MjkgKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90
ZToKPiBUaGUgZm9sbG93aW5nIGVycm9yIGhhcHBlbnM6Cj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIHZzdGF0ZV9leGVjX25vbGliYy5jOjI6Cj4gL3Vzci9pbmNsdWRlL3Jpc2N2NjQtbGludXgt
Z251L3N5cy9wcmN0bC5oOjQyOjEyOiBlcnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKAmHBy
Y3Rs4oCZOyBoCj4gYXZlIOKAmGludChpbnQsIC4uLinigJkKPiAgICA0MiB8IGV4dGVybiBpbnQg
cHJjdGwgKGludCBfX29wdGlvbiwgLi4uKSBfX1RIUk9XOwo+ICAgICAgIHwgICAgICAgICAgICBe
fn5+fgo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLy4uLy4uLy4uLy4uL2luY2x1ZGUvbm9saWJj
L25vbGliYy5oOjk5LAo+ICAgICAgICAgICAgICAgICAgZnJvbSA8Y29tbWFuZC1saW5lPjoKPiAu
Ly4uLy4uLy4uLy4uL2luY2x1ZGUvbm9saWJjL3N5cy5oOjg5Mjo1OiBub3RlOiBwcmV2aW91cyBk
ZWZpbml0aW9uIG9mIOKAmHByY3Rs4oCZIHdpdGggdHlwZQo+IOKAmGludChpbnQsICBsb25nIHVu
c2lnbmVkIGludCwgIGxvbmcgdW5zaWduZWQgaW50LCAgbG9uZyB1bnNpZ25lZCBpbnQsICBsb25n
IHVuc2lnbmVkIGludCkKPiDigJkKPiAgIDg5MiB8IGludCBwcmN0bChpbnQgb3B0aW9uLCB1bnNp
Z25lZCBsb25nIGFyZzIsIHVuc2lnbmVkIGxvbmcgYXJnMywKPiAgICAgICB8ICAgICBefn5+fgo+
IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8xXSBzZWxmdGVzdHM6IHJpc2N2OiBGaXgg
Y29tcGlsYXRpb24gZXJyb3Igd2l0aCB2c3RhdGVfZXhlY19ub2xpYmMuYwogICAgICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3BhbG1lci9jLzI1Njk2MDY3MjAyZgoKQmVzdCByZWdhcmRzLAotLSAK
UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
