Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE485CD98D0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 19:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0v8vvMU8/r3y31mf4RE/reJpQrD6UC9dh4UEDt0VwyQ=; b=CDC0lAFxNunSGY
	wg2H3oYBdDx5q3MELHgKp82MT0IEW7JCXFbOu0ztg+wJ/zazFnet8Et3cXgs7BHvVwslpQC3gqY6O
	fUz6JuWj6WH9a12qJ0Gs6y3zrRsyOiEbFgHyUIUkcslYXCThIk1es6DGbAs3mI7Xy+BxCc3HDuJuq
	oMxZgE+81N5WqdNYz5FP83mI/e34rWG3hYw06D8sIY71Fmxq0DPZoI74surqVjsGL7seqKdNdXrhU
	a1orzGvgoU9yMs6oL1nvMSIzOGuP+z/FGJxU4uy4/CCgizZbAhVrGuQ6BsqgKKYDj0aJzFYPL7goH
	FRHGmDKUCDUeQ37lu3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcjR-0000000Ayhi-1eua;
	Thu, 13 Nov 2025 19:11:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcjP-0000000AyhZ-3PYK
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 19:11:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0857D60103;
	Thu, 13 Nov 2025 19:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED57C4CEF7;
	Thu, 13 Nov 2025 19:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763061102;
	bh=XPlHEOw1uPJQDazcMEywsx61CVGNF/VpjcTn8wMkkCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oitpd3ZdicpxqLH3v5bMK5Dlw1A1IeaK/f+tMTgfSeNLv6snibjasCa8fSqZIGDFS
	 ilaoa+y3l2jQcb+qTJocZRgmlzNYJaDn3EAu9DGDHd/qKIxK0tmkyjhU2Txd2cqisv
	 aNhkpdWedumHkSV5hFInFMMbkv3zrJuy4L/pysJQMAwj2LyuHGxfPnws2ZY1hL6Cwa
	 V1Ic0ZewDvDwdHjuxn5G151CvWFhEP6vH3mkDkXNug+MjJ0B4RzaKCWG0UOQtkjWVF
	 lSaCMtY9s73rD13zCeObAXRd10IO48NtEimwc7JrnRCNLaeilmBAOmnUfHvaE+uupq
	 eH2Mloms0G7lA==
Message-ID: <ae87f1fe-b107-4589-bde5-21c9f3e8f816@kernel.org>
Date: Thu, 13 Nov 2025 20:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/22] mm: Move the fallback definitions of pXXp_get()
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-6-samuel.holland@sifive.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251113014656.2605447-6-samuel.holland@sifive.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 13.11.25 02:45, Samuel Holland wrote:
> Some platforms need to fix up the values when reading or writing page
> tables. Because of this, the accessors must always be used; it is not
> valid to simply dereference a pXX_t pointer.
> 
> Move these definitions up by a few lines, so they will be in scope
> everywhere that currently dereferences a pXX_t pointer.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
