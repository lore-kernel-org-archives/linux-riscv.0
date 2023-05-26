Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE9AC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 13:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1MtCUKUQIwzuOxCaRVzevrdKSDwCLLbwxXasuPXfvw=; b=b03akYW8qhsD/Y
	rS60JOKV0j1mSJt0ZPrMiYuikInPhQCx/6iXeJuB92+rQuVKq3+jQUcNbXdY5i815cLlmIhPfUkwn
	4s9bXi/p02s8x8IgfDu9EHwzrwPomy3SRNvbXPVPgsQTueQ/dXf0QbYO6ipNV/sTPu86xJwMNTMh0
	Q2bvFux1SD6Jvaxc0MVqzEn004e1bwv5FzuSoaRlKvz9fKqiP9I0Qads6/PNI41pW67iNmFRKLMah
	8mC7oz0pX7NBAjjmjgmxTJeH9PFQNLyCxd54k8eInp7enSrwX1s0enP+SsvZBdJ/dqm9LecqbAaQB
	uLKyO89aNttJAz5CtuOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XHP-002bWr-38;
	Fri, 26 May 2023 13:14:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XHM-002bUr-2C
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 13:14:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f603d4bc5bso8311735e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 May 2023 06:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685106884; x=1687698884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkVaao4LtBpB5P1B3tLZxzGuMjJCrzkDcbHFtv+t/BA=;
        b=CQa5TosoK4BroftU06tqqI4ZdsZA7t32w5o96Hdfl1FoC4INZY5MA/7zJY6nYZPPTI
         G8RE9Pf67umWPGDtgcOkTHjoP4M1IhEOZQ+ddOG401n52y3MuxTjYzE/HYSpzCSs4nT7
         bu5V3EmE68JCrwpU53oNgRRM9RfdJ0TWmcJvMfSJpxqNlHWzmFo+K6pKvCPQdRWhxNWF
         7fZYWRY9NIuS5epHVwkW5KHkWZR0LrP0qxrmfYTmeaLpO7+qGcnN/DMTc6c11dSNHyQy
         aWmQmvmWs9HO91fiE4GxsjEI9xUuC90mhUpFGXYBq13LHdJqEuQCK0saZqvnj/RnsP0t
         VcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685106884; x=1687698884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkVaao4LtBpB5P1B3tLZxzGuMjJCrzkDcbHFtv+t/BA=;
        b=Jg2zLIHwduQCbHFFt655wvV6/3RtgRr/Bio6nY+Ds0UPCODefJSQh/+DBRekLI0Nug
         CLbGDLcXLwRD4iIQFb8rD6gqNHkqrvqQQsbhmUWFmO+rqAH3SAlss/444MD1Fl2HdnIe
         CPln49R1x2h5GFq8kEHRfu6/TxIwsc6mYAYPBs4WVOqK+yb47LeN6ObNoy8fG5z/c3kK
         qK9RpEHG1ZwoILH2/q/KLaniinemHjGawH+Cb2s2zNvrtsiSCCN5jLgGC4mardjuSLrj
         rhG04/NMH1uUzwzscN+IP855iLhF6B4z3qrrCbqoPsVTdHcv1ge+ZU9CT3tMqi0HZB96
         9p2A==
X-Gm-Message-State: AC+VfDyvZtmf7aYD4MdDj7ETPKIpLqH4jd4YY8+B10nF8HnopOkRUUP0
	09MX/I+qqk4cjgkxqvI9sZBqNWdqSCfM88x+QZnk+g==
X-Google-Smtp-Source: ACHHUZ5kH6a3H4k9W9oC92DeCoFNiRyfbYNBHeqWE1xm1hc049FvWVz5H3EgoHgOPAC0o+XiVl6YQZsxliJ99poFoDM=
X-Received: by 2002:a5d:5750:0:b0:307:8800:bbdb with SMTP id
 q16-20020a5d5750000000b003078800bbdbmr1211243wrw.58.1685106884257; Fri, 26
 May 2023 06:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230525-postnasal-monopoly-98adb96ffaa1@wendy>
 <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
 <20230525-shrapnel-precut-26500fca4a48@wendy> <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy> <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
 <20230525-flaring-trading-f2bf0713ae26@spud> <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
 <20230525-desecrate-imposing-d97ab34e06ad@spud> <CAOnJCUKfRv68Bh8ue=ZhMGxai9_UEHLpm3553g2c2NXh-RP-TQ@mail.gmail.com>
 <20230525-batting-botch-7e03393a2d97@spud>
In-Reply-To: <20230525-batting-botch-7e03393a2d97@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 26 May 2023 15:14:33 +0200
Message-ID: <CAHVXubiDezbwZO6X2btvgpq-XqHnxZjXzaMnSK2YrHc_ioLx8Q@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Conor Dooley <conor@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, Anup Patel <apatel@ventanamicro.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, robh@kernel.org, jeeheng.sia@starfivetech.com, 
	linux-kernel@vger.kernel.org, palmer@rivosinc.com, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_061448_908507_D1F51BCC 
X-CRM114-Status: GOOD (  17.65  )
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

SGkgZXZlcnlvbmUsCgpPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCAxMToyNOKAr1BNIENvbm9yIERv
b2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1heSAyNSwgMjAyMyBh
dCAwMTowNjowNFBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDI1
LCAyMDIzIGF0IDExOjM54oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMTE6Mzc6NDBBTSAtMDcwMCwg
QXRpc2ggUGF0cmEgd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gQW55IHRlc3Rpbmcgb2YgaGliZXJuYXRp
b24gc3RpbGwgbmVlZHMgdG8gcmV2ZXJ0IHRoZSBwYXRjaCB1bnRpbCB3ZQo+ID4gPiA+IGhhdmUg
dGhlIHByb3BlciBmaXguCj4gPiA+Cj4gPiA+ICJ0aGUgcGF0Y2giIGlzIHdoYXQgZXhhY3RseT8g
SSBhc3N1bWUgeW91IGRvbid0IG1lYW4gZGVwZW5kaW5nIG9uCj4gPiA+IE5PTlBPUlRBQkxFLCBz
aW5jZSB0aGF0IGlzIGEgS2NvbmZpZyBvcHRpb24uCj4gPgo+ID4gTm9wZS4gU29ycnkgSSBtZWFu
dCB0aGUgY29tbWl0Cj4gPgo+ID4gMzMzNTA2OCAoInJpc2N2OiBVc2UgUFVEL1A0RC9QR0QgcGFn
ZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyIpCj4KPiBBaCwgaWYgeW91ciBTQkkgaW1wbGVtZW50
YXRpb24gaXMgb25lIG9mIHRoZSBhZmZlY3RlZCBvbmVzLCB5ZWFoLgo+IElmIG5vdCwgeW91IGNh
biBqdXN0IHNldCBOT05QT1JUQUJMRSA6KQoKQEJqw7ZybiBUw7ZwZWwgZW1pdHRlZCB0aGUgaWRl
YSBvZiBleGNsdWRpbmcgZnJvbSB0aGUgaGliZXJuYXRpb24gYWxsCnRoZSBtZW1vcnkgbm9kZXMg
aW4gdGhlICIvcmVzZXJ2ZWQtbWVtb3J5IiBub2RlCihodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92Ni40LXJjMS9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jlc2VydmVkLW1lbW9yeS9yZXNlcnZlZC1tZW1vcnkueWFtbCk6CkkgaGF2ZSB0byBhZG1pdCB0
aGF0IEkgZG9uJ3Qgc2VlIHdoeSBpdCBpcyBub3QgZG9uZSBieSBkZWZhdWx0IGJ5IHRoZQprZXJu
ZWwuCgpVbmxlc3MgdGhlcmUgaXMgc3R1ZmYgaW4gdGhpcyBub2RlIHRoYXQgbmVlZHMgdG8gYmUg
ImhpYmVybmF0ZWQiLCBJCnRoaW5rIHRoYXQgd291bGQgYmUgYSB2ZXJ5IGdvb2Qgc29sdXRpb24g
c2luY2Ugd2Ugd291bGQgbm90IHJlbHkgb24KdGhlIG5hbWUgb2YgdGhlICJpbnRlcm5hbCIgbm9k
ZXMgb2YgIi9yZXNlcnZlZC1tZW1vcnkiIChpLmUuCiJtbW9kZV9yZXN2IikuCgpJJ20gZGlnZ2lu
ZyBpbnRvIHdoeSBpdCBpcyBub3QgZG9uZSBieSBkZWZhdWx0LCBqdXN0IHdhbnRlZCB0byBoYXZl
CnlvdXIgZmVlZGJhY2sgYmVmb3JlIHRoZSB3ZWVrLWVuZCA6KQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
