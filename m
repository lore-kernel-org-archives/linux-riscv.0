Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5895CC43334
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jul 2022 18:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7CWRYrdzct+wmKhH5P7egMsuG7OizZSTFjKz9fpgFk=; b=kypJqezlBwJkv2
	Z3aN/bSW1oFlX/gONtJZh/6bXjCXSGvB7eHTHqBE7fgncTGYQ/4ZEh2GfTU5HXen5rrFq6oZNaHOR
	xv9XTl39vmVRH6dlz3r081qxMjScj1YnOtvSwvZFXoNarw5z/KHiLv7odvoPaV16z3TlerNaZT7QM
	ryvyD11hgDyEsIglB8Nw+ilPWwgNYDih7+aIP9xWjrjB78HNzYGnMlfbkqpZVnjHp9uVKR0mohzw2
	w4qj4pGPtwoX9L12xORzOqIMLCsZ80JZLZFK1Z6XfNRwIcUFur3IYyXzV56PYVvEnm/DIeIhsfW+j
	s28/LIXJdWMHOuO57WgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAFDx-008tnp-7n; Sat, 09 Jul 2022 18:30:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAFDv-008tmX-4O
	for linux-riscv@lists.infradead.org; Sat, 09 Jul 2022 18:30:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id o4so2218675wrh.3
        for <linux-riscv@lists.infradead.org>; Sat, 09 Jul 2022 11:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UzXTEzvirVIfQgpRsZ+S3IQH5KHrdqAU7esxyuqlcI4=;
        b=azFPTNNmWWMPgUFKlPXqmgq48Ky1+NFueWA8CeF4u6bOZNNqI/ZouXYtrZzIQI8369
         tHNRrJbP3Sk+Qceww9e7NnrcuDgJ6oXsFN+7UXhcMdUokeJ6YJlHAlJxMvos2ldKLn3j
         7qnyIMJNcvc4n+99h6ZoUqIl96IBxZcSLUP2Row3p9htPHtQDjaOVGMxEPZIg0ThAzku
         JP/YMWoEj/7gz/zYLt8XR5fUmxUTGzc7A4L/NsKoD1clU44nb9/glj7xUMteE9ztqdCY
         xScs/VQryAk4+7BFaPGN8I56D8qyIDvJpCmOtxLQds1DYNF1pzvoTJw1JwfwK48t37Iw
         OhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UzXTEzvirVIfQgpRsZ+S3IQH5KHrdqAU7esxyuqlcI4=;
        b=XOVt0xTM0+j29qYXrilcl3WiNrxFRMxMmrktXQqb1W+Um5vurUpd5zyc4h57zQdNew
         3G1l7mRu/kfPwT5LXpKxHUObPHI6kLaQe/QN6nv2Eum9UpVMWvJvoVzQ0izTAr5ym0bP
         EfOzOlyE+7xNRtzhqEE4otFqpiTnokdfCF79yg1BmZw5wVbTVGhChjmlMWtf7jwgw3ZT
         x+AXGBWMUbD59TjF9HjhTe4XZtYC1g9NRPTnhAo9/Pg6IRyap98ZMoJEAEutk5AjPngT
         56jdIL3I9b+WXb29GOzC4EzyRThxuP1/Ne81DryyOxqmxxG7m5WYaocZ/EZgwHZgWfdE
         Oq7Q==
X-Gm-Message-State: AJIora/cqJ8lCbjKAWZCAy/16e8p2ZdUtedaaZ0olIOnXBFa0yObtdGm
	tvsjBs0hNUycvv9qB+oZqfk=
X-Google-Smtp-Source: AGRyM1tAtrtLBOTNfS7tOy8h/BBFOAIT9pR7nVNc89ZMI3mrlIbdzOc1A9K2XpDn13ZLjn4N3vi0ng==
X-Received: by 2002:adf:e0c9:0:b0:21b:8271:2348 with SMTP id m9-20020adfe0c9000000b0021b82712348mr8620979wri.222.1657391432677;
        Sat, 09 Jul 2022 11:30:32 -0700 (PDT)
Received: from opensuse.localnet (host-95-235-102-55.retail.telecomitalia.it. [95.235.102.55])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b0039db31f6372sm6358721wmq.2.2022.07.09.11.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 11:30:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, nvdimm@lists.linux.dev, io-uring@vger.kernel.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] fs: Replace kmap{,_atomic}() with kmap_local_page()
Date: Sat, 09 Jul 2022 20:30:28 +0200
Message-ID: <5600017.DvuYhMxLoT@opensuse>
In-Reply-To: <YsiQptk19txHrG4c@iweiny-desk3>
References: <20220630163527.9776-1-fmdefrancesco@gmail.com> <YsiQptk19txHrG4c@iweiny-desk3>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220709_113035_212313_CB143503 
X-CRM114-Status: GOOD (  13.07  )
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

T24gdmVuZXJkw6wgOCBsdWdsaW8gMjAyMiAyMjoxODozNSBDRVNUIElyYSBXZWlueSB3cm90ZToK
PiBPbiBUaHUsIEp1biAzMCwgMjAyMiBhdCAwNjozNToyN1BNICswMjAwLCBGYWJpbyBNLiBEZSBG
cmFuY2VzY28gd3JvdGU6Cj4gPiBUaGUgdXNlIG9mIGttYXAoKSBhbmQga21hcF9hdG9taWMoKSBh
cmUgYmVpbmcgZGVwcmVjYXRlZCBpbiBmYXZvciBvZgo+ID4ga21hcF9sb2NhbF9wYWdlKCkuCj4g
PiAKPiA+IFdpdGgga21hcF9sb2NhbF9wYWdlKCksIHRoZSBtYXBwaW5ncyBhcmUgcGVyIHRocmVh
ZCwgQ1BVIGxvY2FsIGFuZCBub3QKPiA+IGdsb2JhbGx5IHZpc2libGUuIEZ1cnRoZXJtb3JlLCB0
aGUgbWFwcGluZ3MgY2FuIGJlIGFjcXVpcmVkIGZyb20gYW55Cj4gPiBjb250ZXh0IChpbmNsdWRp
bmcgaW50ZXJydXB0cykuCj4gPiAKPiA+IFRoZXJlZm9yZSwgdXNlIGttYXBfbG9jYWxfcGFnZSgp
IGluIGV4ZWMuYyBiZWNhdXNlIHRoZXNlIG1hcHBpbmdzIGFyZSAKcGVyCj4gPiB0aHJlYWQsIENQ
VSBsb2NhbCwgYW5kIG5vdCBnbG9iYWxseSB2aXNpYmxlLgo+ID4gCj4gPiBUZXN0ZWQgd2l0aCB4
ZnN0ZXN0cyBvbiBhIFFFTVUgKyBLVk0gMzItYml0cyBWTSBib290aW5nIGEga2VybmVsIHdpdGgK
PiA+IEhJR0hNRU02NEdCIGVuYWJsZWQuCj4gPiAKPiA+IFN1Z2dlc3RlZC1ieTogSXJhIFdlaW55
IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+IAo+IFRoaXMgbG9va3MgZ29vZCBidXQgdGhlcmUgaXMg
YSBrbWFwX2F0b21pYygpIGluIHRoaXMgZmlsZSB3aGljaCBJIF90aGlua18gCmNhbgo+IGJlIGNv
bnZlcnRlZCBhcyB3ZWxsLiAgQnV0IHRoYXQgaXMgZ29vZCBhcyBhIHNlcGFyYXRlIHBhdGNoLgo+
IAo+IFJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gCgpUaGFu
a3MgZm9yIHlvdXIgcmV2aWV3IQoKSSBkaWRuJ3Qgbm90aWNlIHRoYXQga21hcF9hdG9taWMoKS4g
SSdsbCBzZW5kIGEgY29udmVyc2lvbiB3aXRoIGEgc2VwYXJhdGUgCnBhdGNoLgoKRmFiaW8KCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
