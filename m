Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADDFC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 17:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvLi83W9SsC6I6+83fP3odqn9eydKkeEZ7aIARfkn3E=; b=WB8QyGuCGSqNdG
	p0MOkJcwSE1b0kajt3HLQNGL5BjOCNF4iD7QGzKtSMH8QPXuGrlR3dqLxmpDVQoOqWXkiFY5UVEz+
	MbVc+SHCQ4QdITqkXpEzD0tG91vWEJ3QF3dMiwekV7Os8ZyECT0oYaRDYggaNrq7ijSQHlepfKump
	Mc9WdlW/azEcPU2KbmiQvyFh28JDHkUc6kjJJQIjnaBoleH4go1vH/zPkdzPKbaJapnik9X1osk4o
	qymLRHRaDMRMcE3qnOoKhC6d9N9Hn0Ruyc13lJgIhvWzbkt4Hh/HLtkgUWufOMWwF6d96fMVJ0GQm
	HSmSD2h9+3VYMgfdEtmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXmV-00BpOD-0Y;
	Thu, 20 Jul 2023 17:49:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXmS-00BpNU-2c
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 17:49:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b8b4749013so7884285ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 10:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689875375; x=1690480175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8yROjrlp1PPFH0to9KuHuG8CxyzdAeh3ld6lplKCpw=;
        b=fyS7XMJPOaTP42oTe22seQohWF8aMbOeiPkaE4J2rWqXd1fUC0RtFqF+vTZPIJmLNL
         ri3EdeoE1FnRx13n5l+ni8jjeBnGqlLcaqfa1g4UteZwo7zVvXz2VCqdEf4edxKk0Lmp
         W24+7P6VC8EKDRSLRTzjFybQKN16HrMn+ukzGKtFc5+Q9gZIrIKaewXZXAFyEKYdK5F5
         gcp+xF0dnH6zhzNovfCSS4QhbIUL1na8WmipAbtF3FF/YRpO6YXrF1YjoeZtuG4Z7mNA
         fxflv1CyeRy/DmOw1Hm9chGK0mBPDP7svtXQYfW1EWYsP8X4JECAT43UnDtGkdcO4TgN
         L/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689875375; x=1690480175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8yROjrlp1PPFH0to9KuHuG8CxyzdAeh3ld6lplKCpw=;
        b=KspeM8nMEP/dGVeh5txVyn7XgWk9XCrNzeKK+3c7OmZFblsZsCviImx4ITwudJ8K4C
         /yeqpE+lRbM2Z0kGJpoMBM7kWTeoq5nzTcLI+tenbVZ5L8H0VpEZJ9ddKKF42qNAxWjs
         FwuOS7j90tJGnyIfXfuLGDP1JhWYNDQSa/GhTP1Wb+zljdtOdnO3EbwaiqtfYrOq02OJ
         MOSbvJ+K6e+q8ZKYLQjwTnEbgKyF+Q9/EzlearQ7YrwhswN7sdCl7NIByConJJf0Jxpt
         musOHYFC5i266Fspio02t9/VeCyqwqauoc+BDtNFdAn+PMHLYERH2ofEJf59h+OBVjA9
         16Vw==
X-Gm-Message-State: ABy/qLZ7uZFQh7OXZR5/5d/2O/ikeh2KQJ80AaJAs9Ie8vt2anwxtmqh
	sG0HkCp9yr0aTeDNlXJgo2vYIOdRx9DieSapPZ8h8w==
X-Google-Smtp-Source: APBJJlEznZxAu+zz9Hq/h2JamBEIRqdk1o93ouW8Qs8XupLnxLYmEqfyZR8bRDDrnYiuby2sGUoNd8RNY4w9bloJSpg=
X-Received: by 2002:a17:902:a415:b0:1b3:f8db:6f0c with SMTP id
 p21-20020a170902a41500b001b3f8db6f0cmr94423plq.58.1689875375330; Thu, 20 Jul
 2023 10:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <d766f11f-45a6-9d47-3bfb-b3632a0b0f0b@linux.intel.com>
In-Reply-To: <d766f11f-45a6-9d47-3bfb-b3632a0b0f0b@linux.intel.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Thu, 20 Jul 2023 10:49:24 -0700
Message-ID: <CAH2o1u4Y5R16QQsed4TuKKiv6ir+uWB98A3Z5adBaF8pPLQ5Eg@mail.gmail.com>
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
To: Baolu Lu <baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_104936_855207_28DB251B 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgNjoxOOKAr0FNIEJhb2x1IEx1IDxiYW9sdS5sdUBsaW51
eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy83LzIwIDM6MzMsIFRvbWFzeiBKZXpuYWNo
IHdyb3RlOgo+ID4gRW5hYmxlcyBtZXNzYWdlIG9yIHdpcmUgc2lnbmFsIGludGVycnVwdHMgZm9y
IFBDSWUgYW5kIHBsYXRmb3JtcyBkZXZpY2VzLgo+Cj4gSWYgdGhpcyBwYXRjaCBjb3VsZCBiZSBk
aXZpZGVkIGludG8gbXVsdGlwbGUgc21hbGwgcGF0Y2hlcywgZWFjaAo+IGxvZ2ljYWxseSBkb2lu
ZyBvbmUgc3BlY2lmaWMgdGhpbmcsIGl0IHdpbGwgaGVscCBwZW9wbGUgYmV0dGVyIHJldmlldwo+
IHRoZSBjb2RlLgo+CgphY2suIEkndmUgZ290IGEgc2ltaWxhciBjb21tZW50IHJlZ2FyZGluZyB0
aGlzIHBhdGNoIGFscmVhZHkuCkkgd2lsbCBzcGxpdCBhbmQgYWRkIG1vcmUgbm90ZXMgdG8gdGhl
IGNvbW1pdCBtZXNzYWdlLiBUaGFua3MuCgoKPiBCZXN0IHJlZ2FyZHMsCj4gYmFvbHUKPgoKCnJl
Z2FyZHMsCi0gVG9tYXN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
