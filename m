Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A23C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 20:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33E3IEdybFUCKCpdS+4SV9hlCy4NlEQR6suKybHy6y0=; b=uqyRy1yPDolg7Z
	Mq82EKdXq7/H1XQKGnNO+kizjPuSGxo1AzBBdFX1/1l/WeagJAFlqMLQGhId9ilzC5pQgrIGZvFlR
	rY5JEGBMm4PY3YBqWbO3fN/YofVSys8UmSVg7E5SWCq7fSwWJLdMM7sN4+oKzyApg5bY1YASpyZ7V
	xtqG18MDuxadGF+9b9xzdgGMzAwCoPP5Fjfr4R3DeAaNBHDOxmx+huacYYpikDLMqxmHED8TatIL8
	P8n6h4bwCTkUORVCKJtEseJ5pb0+DYGWoQTzl2CndItN4I9sWyQk/M23g0x9YFyTuykzoC+IwLrj7
	1/0OwwSsc8vqKRUkP7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ror80-00000001r70-3EiE;
	Mon, 25 Mar 2024 20:41:08 +0000
Received: from wfout8-smtp.messagingengine.com ([64.147.123.151])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ror7x-00000001r61-3Qka
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 20:41:07 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 97DA51C000D0;
	Mon, 25 Mar 2024 16:41:02 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 25 Mar 2024 16:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711399262; x=1711485662; bh=lC0QogFDJs
	dPPHPVxEtk7oE0Tzlwl0ZdsUXHw0ePYwM=; b=bvwN+wT98TadP1KmewjIVddLCI
	iUNQb5KjKmtYbcUmymAdSGVXcrq0cnuImEWElkUv8aQiFjIaqbruybE15UCMyyug
	9GwAxVztn5vvIWoFl4hcyJ72HxzwEfJif16dMv+UdUpcAHn2Sl823mcNzFnPLCqb
	W6pBXwWCwmhBnhdtvou8R8IkHvT7aLLuCOXYMJKpMfe0T7hPQrzYK2TaKsFk/OVm
	IPkwrdhgrMBn+urySP2jZ694YjgOMBqcC8zf2zU46M2eLTnYnsPuL+3dLepsBNwR
	7p0ecAvjpu8l+3nD4bMcMJ9CAlHAj638U2nyx249rWSFiyfG+xCKtj/e5pfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711399262; x=1711485662; bh=lC0QogFDJsdPPHPVxEtk7oE0Tzlw
	l0ZdsUXHw0ePYwM=; b=wqgZ83aWPxyDI+wzSX9U0KrHrNq97/i29O1o9sx1Jful
	1WwnQDRqrmejTxMpPI/nBoKTimsqS0+Ylkzr0OWPOmM+kr4XSFmZzsBYYzB0wlYP
	gjyRYxnNTSwE5rmegRcU2ECy0PE7fSDdX4HIFckt1HtNR+EiH6B9AfBnkxb+NOGX
	8bPfYyBKC4ZcfzpuGBx2QWNzEo+THzMlGdiIGKztniiPqf1SzJkU63+6lLtMjPSd
	P0ed2ok+4DLA34Dl9jhf5MDPd+MIIGxih8KNmkyaUaxFrlPORy6FyaPyXTOAZe6q
	8fV9ewX2gIfPQ8Hy2kNKNj1kfVaiewsio75arZVSEg==
X-ME-Sender: <xms:XeEBZuk0FbuOuEgUxW_YjyrU17uFvKErVp89hBe9sRc8mRHIftPqZg>
    <xme:XeEBZl35UtIqfkL5SAKWoIBR11qY1LWkz9aU8UAQJo6bS33vbpmr-occllOXI9mLF
    PSfgcEDOd-Q2Mvf7u8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduuddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:XeEBZsoSepjqWDjtz1VlgKWds71Vt3tlS0onZRRpXpPZBFIhF19-GA>
    <xmx:XeEBZino9lvW5VrJOZzEQyZEfd8iDoLaNvzUTctG34SQnUHyQX0a7A>
    <xmx:XeEBZs1zxcx6zOlPx0-u3KV5mix1Ez459hBbfTik2wGebf1NYFzmcw>
    <xmx:XeEBZpsY_52Jij5-YJBOXi3MLHhw-hwI9xdVFdyWi930Koi2Fisrtw>
    <xmx:XuEBZlFUpfLIDx9JBCRRg_11ANdKVJO8vHi9OXf1t_wwjjV4Tl9aGTtsH9A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8D90DB6008D; Mon, 25 Mar 2024 16:41:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-332-gdeb4194079-fm-20240319.002-gdeb41940
MIME-Version: 1.0
Message-Id: <3ac65601-7102-4ad1-ad89-157f7d9cef87@app.fastmail.com>
In-Reply-To: <20240313180010.295747-1-samuel.holland@sifive.com>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
Date: Mon, 25 Mar 2024 21:40:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Samuel Holland" <samuel.holland@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Charlie Jenkins" <charlie@rivosinc.com>, guoren <guoren@kernel.org>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Kemeng Shi" <shikemeng@huaweicloud.com>,
 "Matthew Wilcox" <willy@infradead.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Xiao W Wang" <xiao.w.wang@intel.com>, "Yangyu Chen" <cyy@cyyself.name>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_134105_912783_EEEE171C 
X-CRM114-Status: GOOD (  10.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 13, 2024, at 18:59, Samuel Holland wrote:
> TASK_SIZE_MAX should be set to the largest userspace address under any
> runtime configuration. This optimizes the check in __access_ok(), which
> no longer needs to compute the current value of TASK_SIZE. It is still
> safe because addresses between TASK_SIZE and TASK_SIZE_MAX are invalid
> at the hardware level.
>
> This removes about half of the references to pgtable_l[45]_enabled.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

>  #ifdef CONFIG_64BIT
>  #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
>  #define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
> +#define TASK_SIZE_MAX	(PGDIR_SIZE_L5 * PTRS_PER_PGD / 2)

I see that TASK_SIZE_MIN is unused since 085e2ff9aeb0 ("efi:
libstub: Drop randomization of runtime memory map") and could
be dropped now, but it doesn't really hurt either.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
