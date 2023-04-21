Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E927CC7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 19:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Subject:
	Message-ID:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5t0AcUeCsQNYev0tqezRjdkAVmD8gNpoPidiEnkMbJM=; b=gt5SH1dhgPrqaq
	OaIX8GRa6lhDrBhQYPdeowvbEAJtuOmB6hoiOp281KBpdkvciK+/z87jO3b9Fs/05lEZF/CS8PSUy
	GS9XQ1IMBzZNqHTQjHijP5ICk9dLBHqpbLw05clyFtTXX7Ajv9tpsPUB0HefrwQ3xyjV4z8MaEWhk
	wMGsgUk6nM4DHZ9yvhLa7K/5vF9/ft94pOJJq/uPBzVJxB3qM4hUo4Wn0SSl3eSFY2xjfFkKhx6VD
	IMelO6Vya31ktE6PN9oSnFRbt0GkKhaUBfD4ZORvI/43l8ZvBW/laT0W2vBjJPSoW21h3yi0Hse+c
	Bict0HFLJ6PiTFvSKReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppw9F-00Bhur-0T;
	Fri, 21 Apr 2023 19:10:21 +0000
Received: from out-30.mta0.migadu.com ([91.218.175.30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppw9C-00Bhtv-2t
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 19:10:20 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1682104214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9nptc7nFsnBkPk8XtEJlycB0Q788aB2D6UaBkyu74Y=;
	b=bdXprAp0tYcirhanYw8bQqri9ckfvXGij3zsRaW31Rp79TyHytNiP2LAxDLzMsdR5D3k2s
	/sAQyoNd2ertNgOwtYKlhN53Xmy7kKlJU8m3Bp2V1JtejQ3beDelYG2pLP9Oxelww9x+Id
	ipSUd4q1YPaHNRcS7BdzJqpbW97DvI0=
Date: Fri, 21 Apr 2023 19:10:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Konstantin Ryabitsev" <konstantin.ryabitsev@linux.dev>
Message-ID: <ba235aa677a561ceb2dc776414403dc0@linux.dev>
Subject: Re: [PATCH v9 0/6] Introduce 64b relocatable kernel
To: "Palmer Dabbelt" <palmer@dabbelt.com>, alexghiti@rivosinc.com
Cc: aou@eecs.berkeley.edu, linux-kbuild@vger.kernel.org,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, bjorn@kernel.org,
 npiggin@gmail.com, "Paul Walmsley" <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <mhng-bb70f74f-2b5b-4880-b7bf-975e67dc554e@palmer-ri-x1c9>
References: <mhng-bb70f74f-2b5b-4880-b7bf-975e67dc554e@palmer-ri-x1c9>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_121019_080284_85A86905 
X-CRM114-Status: UNSURE (   4.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

April 21, 2023 2:59 PM, "Palmer Dabbelt" <palmer@dabbelt.com> wrote:
>> riscv: Use PUD/P4D/PGD pages for the linear mapping
>> (https://patchwork.kernel.org/project/linux-riscv/list/?series=733603)
>> base-commit-tag: v6.3-rc1
> 
> The QEMU CI has some way to say "this depends on an un-merged patch set sent as $MESSAGE_ID", not
> sure if that's a b4-ism but it's a bit less confusing.

I think it's patchwork-ism, actually. B4 will eventually learn to be able to include dependent series info and automatically retrieve/apply them in the proper order on "shazam", but it can't do that yet.

-K

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
