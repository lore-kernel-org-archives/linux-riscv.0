Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670A0CD4F3B
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 02:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttpq8F3PgwK19H8mv9v8oT1iCMrO41ib04KsX833AKE=; b=diZVqsnaBtKHOv
	mtc76HjswwHKNgO/RStrUbqHG98/+xq2OUogpKIZl/MEiYO8ZvJdAxG51IPPN+x+bzNDTD+Hb57by
	JYpa83aW5HLTy066nMm5YCSKShCyL/jE/ywwbnK8qE1Ri/2xAymEjIabf9+qfm7Zb+fBN/T0p2Bad
	1g/6gtpQpcuulZMo+QBgLpjelZ2S3pdIg0cutKucR1URmcOAZaqgvpV5LK8qG1/9kiF0Qjq6T1th7
	C82KXyO9ypBe0a+HPeKVrJwkwVd+JMEPpN7ds4vSSQFTA4v8j/yBreFCIfss/vMR+9NlwYwI1l47K
	QLB/LhNl4imlAJA6RPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMxa-00000009nN3-07Vt;
	Thu, 13 Nov 2025 02:21:18 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMxX-00000009nMB-3E9E
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 02:21:17 +0000
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 248AF1A0737;
	Thu, 13 Nov 2025 02:21:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id E75B02F;
	Thu, 13 Nov 2025 02:21:03 +0000 (UTC)
Message-ID: <1dfa1e3566cafbe43a1d4753defef9c82ddb3b64.camel@perches.com>
Subject: Re: [PATCH v3 07/22] checkpatch: Warn on page table access without
 accessors
From: Joe Perches <joe@perches.com>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt	
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
  David Hildenbrand	 <david@redhat.com>, linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, 
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, Michal Hocko
	 <mhocko@suse.com>, Conor Dooley <conor@kernel.org>, Lorenzo Stoakes	
 <lorenzo.stoakes@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Ghiti	 <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring	 <robh+dt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, "Liam
 R . Howlett"	 <Liam.Howlett@oracle.com>, Andy Whitcroft
 <apw@canonical.com>, Dwaipayan Ray	 <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 12 Nov 2025 18:21:01 -0800
In-Reply-To: <20251113014656.2605447-8-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
	 <20251113014656.2605447-8-samuel.holland@sifive.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: E75B02F
X-Stat-Signature: 637x6efm4mgrsxn5df3wupihd98x8qr7
X-Rspamd-Server: rspamout06
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19giTHWCQXhnf4xIrV8ypTp+gyVUJdqk4E=
X-HE-Tag: 1763000463-251880
X-HE-Meta: U2FsdGVkX1/zAceZ5vnh4tbWR1f+Cwm6Gajb5Cysjq6qV34Cj9ZhK7eypGnKqYKEn8aGGYIrbdej0PNanG4Y7TU/rQFSPu393I2CQtbbB+tC8raIaQXcfTo4/QsU+zfgvxgvrkbI2t+kILkdA2MOrD1E61pPCOZlLL5D27VIEclZ4WR5+L5e2bEJGUcPo/3BvvjYsMlCufHb2LdyCWotOP9G0jDRsl191XUc0vokRa6gejGK8FjkEibcUKMjgguRZP81NCcHiR4kBfuLcisXBHTUQG1ReqMmWiKYx9A+Ot1h30HMlHgxWYbe8+ei1wEa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_182115_870795_4F773281 
X-CRM114-Status: GOOD (  12.38  )
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

On Wed, 2025-11-12 at 17:45 -0800, Samuel Holland wrote:
> Architectures may have special rules for accessing the hardware page
> tables (for example, atomicity/ordering requirements), so the generic MM
> code provides the pXXp_get() and set_pXX() hooks for architectures to
> implement. These accessor functions are often omitted where a raw
> pointer dereference is believed to be safe (i.e. race-free). However,
> RISC-V needs to use these hooks to rewrite the page table values at
> read/write time on some platforms. A raw pointer dereference will no
> longer produce the correct value on those platforms, so the generic code
> must always use the accessor functions.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -7721,6 +7721,13 @@ sub process {
>  				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\n$stat\n");
>  			}
>  		}
> +
> +# check for raw dereferences of hardware page table pointers
> +		if ($realfile !~ m@^arch/@ &&
> +		    $line =~ /(?<!pte_t |p[mu4g]d_t |izeof\()\*\(?(vmf(\.|->))?(pte|p[mu4g]d)p?\b/) {
> +			WARN("PAGE_TABLE_ACCESSORS",
> +			     "Use $3p_get()/set_$3() instead of dereferencing page table pointers\n" . $herecurr);
> +		}
>  	}

Seems like a lot of matches

$ git grep -P '(?<!pte_t |p[mu4g]d_t |izeof\()\*\(?(vmf(\.|->))?(pte|p[mu4g]d)p?\b' | \
  grep -v '^arch/' | wc -l
766

Is this really appropriate?

trivia:

izeof is really odd looking.  I'd prefer sizeof.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
