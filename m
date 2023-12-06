Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C6BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5qR/FMRKy0roiTNZAq6wPK1DyLezmUCInQwWkV8cpoA=; b=WnHR+l/WzRm00RxWGWFEE/6fup
	F22+oDPZiUugMvG0tPEvpH0y2eQoqaW7LLLgsRnRdb5I1jsPyxUk+Fp2193faA7Unqkj89GYDcx5u
	LL/ReS6QLQK/LoEDZqCJz9PLlXXFVAjv+5o98aVZ6V6DnV0vCRUeq3n6pPAh+5dSr/+Sc0geIA9Ti
	JNPwD3kWBUiMQBhC893KWAryLbF+dHcrNxq8Cm7rHHv/GhTKbc6JsdZgkFUqb1yZkQ6q7uLZqzjAg
	AenTooHVnZLDQOGBxJNMjEXkvhe1kf8Exy+omMen6M6id06x5jMfO3Iq7Sy2pexEP9gErAR+zP9mz
	sjwx4SdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvNP-00AqrA-1c;
	Wed, 06 Dec 2023 17:07:59 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvNL-00AqoA-04
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 17:07:57 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2866fe08b32so27392a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 09:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1701882473; x=1702487273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62swcpHmDcdrzEklgnBANJd/n5tMHFnHaZwN9QLuoRY=;
        b=XnvWARrzGIW5p0wEK2G5vsCassRFd/mQ8i8Y2bm3t9eK6cQXFXQZc239zjZV9F0si4
         vGxB5cOWhUa8dnS4+ReNvnhkAWk1wkEwd0DU9BhFxZniUHM/zqXt5FNdGrngJiyA6j/v
         5wmeYzkxQZlRbX0LhmQR5crhcy8j8tv2ctUCaPqQAxSmUs1iuAlsJjPncsSxFZzNPd3q
         vm3wopFsTfwm8xI/Q/dQO0Niv/cq1ktVvBL+LFeS7rmqnextahhscurtLWkYnVVx2LrF
         XnU2jlU7VRIbv0UxnSntaYyE99OGhzeBdrUR/Wl4tS35P+DKIog4zSe9S/N5Eg1FfklQ
         tMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701882473; x=1702487273;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62swcpHmDcdrzEklgnBANJd/n5tMHFnHaZwN9QLuoRY=;
        b=Jn/CuuGZaeT5rfzSysTDCekOK2k+73AovnXWl5b2+763LPDRLuNfG3MDlGOMj8NsB+
         vOJOGNTWsn9ZkYoVK6SuORxPcjZeB8/qPiSOPF9APox9ycDmREKF8Y6TEp8q4N11I0gD
         0aYfnE62Dex7uZ/0OVa2rvolsZkH54O28exRQ7stYbLtgyoI3tiiO6uxLCXhsbxVmUDL
         EFdIeL8ydzrBgSiGAM/BflimICGtVXcF7ntIlraoVDkr/kGWVsHgr11tmilaVnSRS9dE
         PRj66qEOjm2kQAd/Lzt5v2h5uNo5HrFDPU2ece89YHym1uKT9yzTevcDt5gQVsoou7lv
         LXkw==
X-Gm-Message-State: AOJu0YxD2AwYXJ+ZefBsJ00i1r7ghBU8RnYzlJ15nshNDBDJSCJxUWEF
	iltUwfGlSiXMoCm97Xl+TsyBiw==
X-Google-Smtp-Source: AGHT+IFNdOlSwSYRE5V19ix0+QEWJdVY39+A0aCl0rPmo2N3/BkNZKr80Gs2ypCNqOVZyHsks6oS4g==
X-Received: by 2002:a17:90b:8d0:b0:285:b67b:f435 with SMTP id ds16-20020a17090b08d000b00285b67bf435mr930224pjb.41.1701882472807;
        Wed, 06 Dec 2023 09:07:52 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 26-20020a17090a005a00b00286bf87e9b6sm76581pjb.29.2023.12.06.09.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 09:07:52 -0800 (PST)
Date: Wed, 06 Dec 2023 09:07:52 -0800 (PST)
X-Google-Original-Date: Wed, 06 Dec 2023 09:07:45 PST (-0800)
Subject: Re: [PATCH v3 00/12] RISC-V: provide some accelerated cryptography implementations using vector extensions
In-Reply-To: <20231206074155.GA43833@sol.localdomain>
CC: jerry.shih@sifive.com, andy.chiu@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, herbert@gondor.apana.org.au, davem@davemloft.net,
  Conor Dooley <conor.dooley@microchip.com>, Ard Biesheuvel <ardb@kernel.org>, Conor Dooley <conor@kernel.org>,
  heiko@sntech.de, phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ebiggers@kernel.org
Message-ID: <mhng-9f5b6a98-57f4-40a8-becc-93319bbed97c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_090755_064704_317AB508 
X-CRM114-Status: GOOD (  32.61  )
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

On Tue, 05 Dec 2023 23:41:55 PST (-0800), ebiggers@kernel.org wrote:
> Hi Jerry,
>
> On Wed, Dec 06, 2023 at 03:02:40PM +0800, Jerry Shih wrote:
>> On Dec 6, 2023, at 08:46, Eric Biggers <ebiggers@kernel.org> wrote:
>> > On Tue, Dec 05, 2023 at 05:27:49PM +0800, Jerry Shih wrote:
>> >> This series depend on:
>> >> 2. support kernel-mode vector
>> >> Link: https://lore.kernel.org/all/20230721112855.1006-1-andy.chiu@sifive.com/
>> >> 3. vector crypto extensions detection
>> >> Link: https://lore.kernel.org/lkml/20231017131456.2053396-1-cleger@rivosinc.com/
>> >
>> > What's the status of getting these prerequisites merged?
>> >
>> > - Eric
>>
>> The latest extension detection patch version is v5.
>> Link: https://lore.kernel.org/lkml/20231114141256.126749-1-cleger@rivosinc.com/
>> It's still under reviewing.
>> But I think the checking codes used in this crypto patch series will not change.
>> We could just wait and rebase when it's merged.
>>
>> The latest kernel-mode vector patch version is v3.
>> Link: https://lore.kernel.org/all/20231019154552.23351-1-andy.chiu@sifive.com/
>> This patch doesn't work with qemu(hit kernel panic when using vector). It's not
>> clear for the status. Could we still do the reviewing process for the gluing code and
>> the crypto asm parts?
>
> I'm almost ready to give my Reviewed-by for this whole series.  The problem is
> that it can't be merged until its prerequisites are merged.
>
> Andy Chiu's last patchset "riscv: support kernel-mode Vector" was 2 months ago,
> but he also gave a talk at Plumbers about it more recently
> (https://www.youtube.com/watch?v=eht3PccEn5o).  So I assume he's still working
> on it.  It sounds like he's also going to include support for preemption, and
> optimizations to memcpy, memset, memmove, and copy_{to,from}_user.

So I think we just got blocked on not knowing if turning on vector 
everywhere in the kernel was a good idea -- it's not what any other port 
does despite there having been some discussions floating around, but we 
never really figured out why.  I can come up with some possible 
performance pathologies related to having vector on in many contexts, 
but it's all theory as there's not really any vector hardware that works 
upstream (though the K230 is starting to come along, so maybe that'll 
sort itself out).

Last we talked I think the general consensus is that we'd waited long 
enough, if nobody has a concrete objection we should just take it and 
see -- sure maybe there's some possible issues, but anything could have 
issues.

> I think it would be a good idea to split out the basic support for
> kernel_vector_{begin,end} so that the users of them, as well as the preemption
> support, can be considered and merged separately.  Maybe patch 1 of the series
> (https://lore.kernel.org/r/20231019154552.23351-2-andy.chiu@sifive.com) is all
> that's needed initially?

I'm fine with that sort of approach too, it's certainly more in line 
with other ports to just restrict the kernel-mode vector support to 
explicitly enabled sections.  Sure maybe there's other stuff to do in 
kernel vector land, but we can at least get something going.

> Andy, what do you think?

I'll wait on Andy to see, but I generally agree we should merge 
something for this cycle.

Andy: maybe just send a patch set with what you think is the best way to 
go?  Then we have one target approach and we can get things moving.

> - Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
