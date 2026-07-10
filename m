Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920A0C44506
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZqPDc44xVS4MlPGE3Y9WRh0uRjD7OaOo2vGVnJrpD8=; b=Ofq+SE+tBVyjSR
	zwnUkZHy5q+07AMS+HJ4OONIcGaOAenOWqkZS0eqb9URBgdPwMKbc9L9LnldrS9X+jV2oeaPwe41+
	K6cp/30Wc8pqpZ3O3kP5tH++BKKzXQKoGocEugQbnnnaFwwO8ryNRvUQRU6G3NuoncoJh/0co7eNi
	N8DIYDVZ+pKUKSy0jFWlnDD1vTTi5Kbo/6yFacQjd9Scl/IvCMuJT1UE7k2DOgviF1ag0SRWNR/gb
	gklPiRy9EMYeHkpQhkTfdpEoQ6p+THhpm3U+TBWOwoaJoXvwgHJ8jbQQcAZj2EogY7OPShL+zRgn1
	NSsGsmgU0hRgCcUSnBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7bz-00000004at7-0KYx;
	Fri, 10 Jul 2026 09:33:35 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7bw-00000004asN-3Fwq
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 09:33:33 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6a1888969ddso452377eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 02:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783676011; cv=none;
        d=google.com; s=arc-20260327;
        b=KAKOR3h+r/qmnLXG5AjkhDgKHoOzu55FTJBRwUZeGEGaBoLFpl4MeqcRcPx/iTv1/Y
         hDYqhymnqB/RodK3q2scdmyguibYXew585sCRqkYgvRSjyWJe4Va3Bs8hroy6ZB1eyGc
         TSJFTdY0tOlis57BxQV0f1beuVvlF0jVHFOTG7wYyUYnKqrg0zGaGc2Uh9xUi13Im0OV
         c+FL86KHdfDiCLB+Gs+pV4EMA3I9gqM7yiG8U54Y0oIP7LJhq3tdtmX8aQ8Agpz9Sn6X
         8pJtHyXORTaLmVPIRvAWPKUzqSF34r58lj1pH4UGVkZtM5ZUL/cIRo0CfpquI0VwQXT/
         VZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FOfAMidp8rQWZVqstmTup6Rkr74TOq97Goi620POv9w=;
        fh=Bf9rbELANRAytY25+J5G7FBSJ4hb7+Qb17NmE5ODMv0=;
        b=KJ1M30/HezvDMBFWzBQm/tTq91gmzEoS3Se4b+0rYHw6cKyCafEQGMU6iZQTZPN3Ev
         QfN8297omslR0LeRm5f+7orTs7V5imNhLUxy1+1vLWBJ6F9OOne2ElztoEw3n39Hh2nD
         PJK82vnEaaYgVOo/MK5F4rduALuPgMv8KK/GRnCYotRG+wxnQpYkG9PgERPW6d9GCw+4
         /aVMkrN5/hQHWHjb9qZoL0JA4x/LLHR1KppEBmNTBpfqxpOx5oUAZGGLbW1egX7xILTz
         7I6sRrDkB/Chwryw23H33K0XMrCdEL5Zmn/GmxR//saGBXb/aIfupFPtm3AW0swsG0PN
         Vffg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783676011; x=1784280811; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOfAMidp8rQWZVqstmTup6Rkr74TOq97Goi620POv9w=;
        b=pNbxIdYVF57NnmOgB44dGCh5/8nbOfgfBo1CP5Vyh0QnQvObSSQX+FvhjpRNpbMYse
         le7qQxa9MwTlJFXPCjwkzICI/LIv/ZXzps2Y32luVMo/T2IwbMl1MgAywYsxenwyw8rG
         u1MlczY1IxAL8LBKc1vzGzKErXyKhFAr2RcTBEo97xW4PQdx+BnNDcas2OvyLVJdsR/m
         KYWuBQz7Oivr0Wwtjk59PH0VyriH1Vd7eQBR2hH4zlOhkMcbXV8xWpCon9XuWMxSq6V4
         IaGPJQ8ZkFmVlVek/Y0WjYi0r3PsBjZ98pz94mWKumxeV8LxC5dyNkIN8Hu4tMRU8EtQ
         oNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676011; x=1784280811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FOfAMidp8rQWZVqstmTup6Rkr74TOq97Goi620POv9w=;
        b=EUylOauo+Uu5MUg+45ToeavjoF4yB+B19jIjxAI9UTjlpFaFOX5Pluxo6nhS4P4d6E
         /9MgOMLIYYxTeX0ukEx/sd7/fTjjeKeHdga2ib1jyE9gtXFP1X1v9JI0iMrE639gjuKx
         4pzHyevraNQYWK4thQ/wTJ5DeyQRKFlm6pi/uWTJzusuYioFpaus/y4NxazRCXN+WTLN
         U/uRekWSyJfP+PwslwbFNCnTgAsErXY5tseTIeaHMbx/KB9s0OtauknzQViB8ygLrKLu
         xMKJSggvQTe0L/h/F1dyq70mLcMMRzgP1jkMLUkoWEW9AYJvg6ryhBp+VA1qIjk60tHn
         xS9w==
X-Forwarded-Encrypted: i=1; AFNElJ/Aku8eKAfB4JYFnaazTilBQSP0lg5GJF15wF37owsR4or9f9TcgtUNRTvAOCsm639mEm+2uEVKZmhSoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD5mIT7tJ05g7SR9NFyJoJbWfudpsc1UV9uZs1wN01kSg3IYl6
	fg1fUzsRSMTrMan/+xDugrlBf4OUL1vNyNjmW9pP40B3zWDMwccUWak1yLD2ZlOPICmXaxGW7+Q
	wkmuaOeKan1khpVDUdqTZTLhzx75H0+o=
X-Gm-Gg: AfdE7cnNYn7Rd/YBDDETh4Gfvmz0Hxm8umoMAja0lnUf5YXbEe7zX89VZe5uKGnKUfd
	qYpx8rwEezW3nD09oILIC6Nw79Xs+FLq8uYQaoHl2noECJMOYLa3ctJivUnFp5WW5g0EpLd9zeK
	tPw5iUS7XCtCqbQfldJxH+/7mKDwDlR76pcUo6IIihiNfrtz9qXs7knLkP3pu0Z6ST8iypWXfO6
	TauCwnB0pTQoeOqrjwZG0LH6RxaI925TMNC1vqcIxIZyc8vDy5sKXv5YjuD5ivNC0i725KHKoLI
	D3voxP8ceMJ9FWtexcmCt7acXmZ+EqSPhmE1Xg==
X-Received: by 2002:a05:6820:a09:b0:6a3:129b:e617 with SMTP id
 006d021491bc7-6a36dad9b1fmr6981190eaf.71.1783676011361; Fri, 10 Jul 2026
 02:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260706203128.162335-1-devnexen@gmail.com> <ak0YI9KjSstnj9rJ@lucifer>
 <CA+XhMqzvFtLq1OT-qh207aJhSf+okdE8o8Joe8e_KBvdCjcQfQ@mail.gmail.com> <alC3HqLVTBA92Prx@lucifer>
In-Reply-To: <alC3HqLVTBA92Prx@lucifer>
From: David CARLIER <devnexen@gmail.com>
Date: Fri, 10 Jul 2026 10:33:19 +0100
X-Gm-Features: AUfX_mztOU5_jS5IjGzUbvmTi3ipFisydF61T_Ppm1lypDXePa4kecWsqywAZ5E
Message-ID: <CA+XhMqzvW=Ar__NFVCLEcJYUnfmnRhTEtAV_iT62U45B7tAR6A@mail.gmail.com>
Subject: Re: [PATCH v8] mm: pgtable: free kernel page tables via RCU to fix
 ptdump UAF
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dev Jain <dev.jain@arm.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_023332_819568_7193105D 
X-CRM114-Status: GOOD (  21.35  )
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

Hi Lorenzo,

On Fri, 10 Jul 2026 at 10:13, Lorenzo Stoakes <ljs@kernel.org> wrote:
>
> On Tue, Jul 07, 2026 at 06:08:49PM +0100, David CARLIER wrote:
> > Sure thing :)
> >
> > On Tue, 7 Jul 2026 at 16:19, Lorenzo Stoakes <ljs@kernel.org> wrote:
> > >
> > > Hi David C,
> > >
> > > This has been through a lot of revisions so I think for the sake of expediency
> > > the best solution here is for me to grab this and fiddle with it a bit then post
> > > it out myself.
> > >
> > > TO BE VERY CLEAR - I will keep your authorship and attribution :), and simply
> > > stick my name on a Co-developed-by tag.
> > >
> > > So this will remain your patch.
>
> Apologies, but the approach I'm taking is very significantly different so it
> would be problematic in terms of patch provenance to do this :(
>
> I will make sure to credit you directly in the commit message so there is proper
> attribution, this patch and follow up stuff has grown a lot (been working on it
> all of yesterday afternoon/evening + this morning) and need to ensure the stable
> stuff is backported etc.
>
> Thanks for your contributions here, very much appreciated, and sorry to have
> messed you about on this!
>
> Cheers, Lorenzo

No worries I understand.

Cheers !

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
