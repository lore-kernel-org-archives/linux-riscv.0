Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FFDEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 17:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozEfiM9/9j0YxVpt/+QsaWZ4xMZEXeAp+PsAIGNI1oA=; b=4FmoC095x2YUBr
	tO8kiqljXxoElSKcLQFOkNL0Dau7GJsUtK14SSRCaZpnEBI8ywQKu+na00xB03dHRdYpKamo9UgR3
	rGu0yFRVFqh9/Upj0UJ8+6Nk7NV4bMC5sjZzKOjb9Zkn0r2xBRn7LTJYptosBrLBYqGsVDGU6YcLk
	0RSKGe0Y7Zs/A6oofBIqZ8jVjFMsBdLRZ/iEO8H1enJTWCbOo72zeIfWlT+MafJpW7Q1syrn7+vPm
	j0cq+fABI2v3NrDN6wvN29rH0TtGxvIF+rKcYR7XfGNTJqRIi+GrGeYCPzstkw7rbrFqnUUH+TKMF
	j2t3WnPYSzIOVtbdp0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXWY-00BnUW-2E;
	Thu, 20 Jul 2023 17:33:10 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXWV-00BnTQ-1x
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 17:33:08 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-263036d4bc3so623000a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 10:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689874385; x=1690479185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghQpfFyvcfhUNISvLwJyXktxUkGP1dSbutRKHuLM3bw=;
        b=dfISc7U6AF5BJRDv8tvjGb/dY6p+ULVVoRlY0W50Ki8JhqALjc5fwJwr0qMlKmM41b
         nkePpa4MjWqtrC3H+etMall5C1i2RCWAd877lqFJq0trUt166uqd2WPKoPJlHCuYAK33
         1+WGH/EeEp7h85+vs7uq7kfg0/UvoNPpY/mZhF7mS3H9T5nBEDZb8kkpKXGy9kwE+MDz
         HCJQ4oow1i1mNO+8YCAXWK1bjkEr3/TF9NsqQ1b2B4UTPrVOLICIGH+nUC6FLIDTbr9o
         jH8et3vA22SYu6+YJIxV5cJfxn5FHGTqRIhVzWxposUnSULOclCAYCDAOx+lEF10yvNj
         B2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689874385; x=1690479185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghQpfFyvcfhUNISvLwJyXktxUkGP1dSbutRKHuLM3bw=;
        b=eah4uDZ5BV964raei2KarJlR9P9rG7eIa8ja0w19Ia7zyJ4isHhzKy/Yjc/I27GxT1
         +tnDxs4vHwUL2mlFWthNCjCtGX/h03WFp4xFOjuK1Zf2YndRxoASVzYJ+GXNJbIwMvvt
         l6wjaPsdSn4rlh+CJ86qx8ld4guO8LdrJ02UjmKCsWLXRMyLRmWZ0mPptjez2aiUa0oV
         6r2W6Zd3WFni6ntKiwxb/RbnlJ69JSWhsTnDRw/h/kYLYnV3wCsWvzcTvVKi8o5mMtce
         O3OqvO43kNmiI1ZYvJBHFJHmZ2lDX/tIWfYZa7vLB2aUB+ap4S2NNUX+Q87xUjjwv3Vb
         4VWA==
X-Gm-Message-State: ABy/qLYLkQxiCBflOb89n9OX7AbEXJEZ/zLb3QcLRkGHj0gFoDLZkPxG
	SjG6Y3zfo3Ok67WjstGzmXllAHZGtU6HI1LXATaO0w==
X-Google-Smtp-Source: APBJJlFxII+Gi7msvyAsb7Vr6LA5urVxi7htutTXVflD5dwYC2EC1sjXNCgFUpAOMtOs2njJbMS+eqcv23XsZ0xHh4s=
X-Received: by 2002:a17:90a:38e5:b0:24e:4b1c:74d2 with SMTP id
 x92-20020a17090a38e500b0024e4b1c74d2mr129400pjb.32.1689874385349; Thu, 20 Jul
 2023 10:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <e1578b96b9c75433d8c49b6a173ff47a64675c2b.1689792825.git.tjeznach@rivosinc.com>
 <376985dd-a8b9-b86a-3c12-4633dd4505d7@linux.intel.com>
In-Reply-To: <376985dd-a8b9-b86a-3c12-4633dd4505d7@linux.intel.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Thu, 20 Jul 2023 10:32:54 -0700
Message-ID: <CAH2o1u4GuVw-V0AVar97F7ByRWpgRBMrAEP_FTvsrxSKqF8pEw@mail.gmail.com>
Subject: Re: [PATCH 04/11] MAINTAINERS: Add myself for RISC-V IOMMU driver
To: Baolu Lu <baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_103307_646261_FA5B39C6 
X-CRM114-Status: GOOD (  14.22  )
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgNTo0MuKAr0FNIEJhb2x1IEx1IDxiYW9sdS5sdUBsaW51
eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy83LzIwIDM6MzMsIFRvbWFzeiBKZXpuYWNo
IHdyb3RlOgo+ID4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9z
aW5jLmNvbT4KPiA+IC0tLQo+ID4gICBNQUlOVEFJTkVSUyB8IDcgKysrKysrKwo+ID4gICAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMKPiA+IGluZGV4IGFlZTM0MDYzMGVjYS4uZDI4YjFiOTlmNGM2IDEw
MDY0NAo+ID4gLS0tIGEvTUFJTlRBSU5FUlMKPiA+ICsrKyBiL01BSU5UQUlORVJTCj4gPiBAQCAt
MTgyNzAsNiArMTgyNzAsMTMgQEAgRjogICBhcmNoL3Jpc2N2Lwo+ID4gICBOOiAgcmlzY3YKPiA+
ICAgSzogIHJpc2N2Cj4gPgo+ID4gK1JJU0MtViBJT01NVQo+ID4gK006ICAgVG9tYXN6IEplem5h
Y2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KPiA+ICtMOiAgIGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPgo+IFBsZWFzZSBhZGQgdGhlIGlvbW11IHN1YnN5c3RlbSBtYWlsaW5nIGxp
c3QuCj4KPiBpb21tdUBsaXN0cy5saW51eC5kZXYKPgo+IEl0J3MgdGhlIHJpZ2h0IHBsYWNlIHRv
IGRpc2N1c3MgaW9tbXUgZHJpdmVycy4KPgoKYWNrLiB3aWxsIGFkZCBpbiB0aGUgbmV4dCB2ZXJz
aW9uLiBUaGFua3MKCj4gPiArUzogICBNYWludGFpbmVkCj4gPiArRjogICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvcmlzY3YsaW9tbXUueWFtbAo+ID4gK0Y6ICAgZHJp
dmVycy9pb21tdS9yaXNjdi8KPiA+ICsKPiA+ICAgUklTQy1WIE1JQ1JPQ0hJUCBGUEdBIFNVUFBP
UlQKPiA+ICAgTTogIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4g
PiAgIE06ICBEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1hcmFAbWljcm9jaGlwLmNvbT4KPgo+
IEJlc3QgcmVnYXJkcywKPiBiYW9sdQoKcmVnYXJkcywKLSBUb21hc3oKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
