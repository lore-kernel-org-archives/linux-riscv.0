Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1142FCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgf9IgMqDnGqUY1LxMVHN3cJA1CFVlxHwp2snvCtUbU=; b=HI3U3K3FxyHxiL
	l/m1Om83h6AfsvhyM5nmPVhvunDH5vlSUxhKFnjHOiz+45evkAWTRDncDknhrJzKcT1JCSFXNSG+l
	/qNZ4pZSW4ma/1QbMW4d8vRAzXmRDKdDJJRNISXR9/aKnK/HDJ3u4CLTXc8z6sIPbsf4Mof4UPZQs
	CH5xGYd4Z1ftZdUSHdGsWFZ2jetn4g4A39oPnZePvAEde51reMlIzEXIu76upck39gOBJ5vWgj+IJ
	iptZ3duaj9SuJtjcdYMPuFoz18/CVsClUCytdv3Zfr7fAxjS6saXTSfZAvuaPm/kkXpfGn2hHV57R
	RSsGgwiCX4Id2i+91Bxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs9z7-00000000Wai-32rL;
	Wed, 03 Apr 2024 23:25:37 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs9z3-00000000WZD-2zXj
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:25:34 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-432d5b5f00bso3171011cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186732; x=1712791532; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GmJbmiupcx0+YepTHaKrpuRO+1mTwNA65vnk45fWOSs=;
        b=G5f+NFGSKpbCYix1vNwATj19wNLHXPMnCtMqLtovwVcTTK6ZOeZGOXesmeIH0I5u06
         mq3UhO7cceeJR/X/emitszL5nsPh8FEVNwvqbkxCtDQZUzzq/8MDRXC2SQDK5GR0I5t3
         iZLgWWsZZ7MRWaNwXWRcBIAi2f6CRDaNbXANgCCG8o5c2sM0tzg0GGMT2QNwT3Hke9io
         Tu/oTRvabQ297ZenEn03pCmnHKSuJE1MrhJkrOrH+tmVdTsGZ9bcEQCAULncN+Aj267Q
         Hhz1tsmZn8odSrcAHkJBUOvJrxkI71vjQKO3ZnSN12ELIcq6AtvApA8Ol+V5CRk2Vuyc
         hoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186732; x=1712791532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmJbmiupcx0+YepTHaKrpuRO+1mTwNA65vnk45fWOSs=;
        b=wOxqagmHHAdvqEuwrBQCoB4pXRucAkhnP98D3k76GrrSN2wVCgEx7k3yz/MYR6jmiq
         gAi6nfNHZsmUDm2Yh703VXdq2B+2g01Q7gYOAxUSLLx3cYojfZ4EuEyoe1rZQ69H8gxZ
         n9P3OACJXzY2b7+g7PvAgmPgfYejECtcJFwOyFRiZznPeFOGJbZjc8dP1Eo129gSscm4
         /jgdJ0xALU7GE0RW5+3LfzLEyoqmroYugsZPfWr4UigixfRj+VMi58AjhjTcMatqVnt2
         vH7EPKRMPyZ9PSuvRrn4QjMZYSWEHLtXdda6Kdl5b/J0yB7txgjV6UmaevSr7++H4E1S
         v+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhR8etKa+8mV4C5LH5Z2vnXwO1pHM6ODA6kc1waLdETjYAgLHAzGbz9EkW4nO7e6L7hBryjxKLSKjpwp/excWmpmyk5p9C+6G9Ckjk5S1r
X-Gm-Message-State: AOJu0Yxn4LYHK11oIi8zsjg02Q0Y+5MeImCqly93oBGy4rLShBgyPLi2
	QNgoqX4WD9vy3d/qURvZEGTnIHufcUibHnH1SBt5i7V+BmSuUAhuqKEnRWbwIfAZyw1yjwpMeWN
	tWjcrOtHwpb6CNBVFmNAXdZQ8t8jRqRM8uMNFwA==
X-Google-Smtp-Source: AGHT+IG4cakVm4NzKcIyV/UubugIHhSwRR2qjKeTq6l1PskAOoNKG9I8iwXmwJY7qCLP7GuuPX2fJIJ3oNUu9sbQPRA=
X-Received: by 2002:a05:622a:306:b0:432:f37e:d274 with SMTP id
 q6-20020a05622a030600b00432f37ed274mr1865869qtw.8.1712186732715; Wed, 03 Apr
 2024 16:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-1-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:24:55 -0400
Message-ID: <CA+CK2bA7qp91CKKqbLzrOsv3J88AwON71FTQ34JVKhi_c66s_Q@mail.gmail.com>
Subject: Re: [PATCH v12 00/11] Support page table check PowerPC
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_162533_781885_0AA88C57 
X-CRM114-Status: UNSURE (   4.13  )
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

All patches in this series should be also CC'd to linux-kernel@vger.kernel.org.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
