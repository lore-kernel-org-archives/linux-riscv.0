Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D380C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 16:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQawqb6BMJtTcq66NovBfO7zSz4nWKMdIiX4/CrQGSw=; b=eNif+Fy+v62lgU
	I096RuhUpZgHfYcgm9462D3GPYXfmoRMAq9ZPPRAZ578mBHOHFjpktco3iTkjtAb9EwMEhzFAMI6G
	UwzIfkHhPsKrC6jsP5IfMPrvS8ezv6vchAyn4Nd/mfdWJSqEWDmEZZEgKbgtm7EZ6UJj7qpQdZl1r
	/CXVN98Cg/wvPzv+lQRSNAFIrJOWrJdq8gRIUah2VhcLH1znI3hrn2suI28jxDlH3CJXbYBFnlbF0
	PQRJJx3kKY9vWZciX3ghtKLucufC34Jzi49uGzFS9npy6Iibbp78agFCpDnO9ieHdqgnfbh8Wu0qn
	2xbvanak4hChdmoBD+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjQM-005wfW-2E;
	Mon, 11 Dec 2023 16:46:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjQI-005wdl-2n
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 16:46:28 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a1c7b20f895so546434366b.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 08:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702313185; x=1702917985; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=noVxPYQYTouWSdFR1RAszjBhMSmcJiRgz0SE80oZI+g=;
        b=GjL2iZ1M2OxrnKMKRQcarXvXPSEsN28YkiwUNCnttXnN6pK9Q8Oog4yrWYt8zrHCcE
         v4NILk4aCQQ3s7BmEcOjm/nSAeRAI7tPFDDAWUjhjQwBjFf9TREH0VMv4TEyvFTOP0AV
         E2bZSXDF0NVVwdj4nQbDkB/jAtjeECX5ehFGASHWWlovo2x5aDdLcBMk+N2sNKvh+lE1
         0FBICeG2R7eb9fS8XWY5lpEIUX5AZCiF2rCymWTBNCgJHHnG/y1M2DX/kUwpFlAVTfEc
         dMdwWV8Ww9iDBoXNC9N/IH5fmT7MwptS4ni2vHhmHLf4TWQkuQ0gGhDcfbu5fwWAeE6y
         tBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702313185; x=1702917985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noVxPYQYTouWSdFR1RAszjBhMSmcJiRgz0SE80oZI+g=;
        b=u+Q3GXCuBtHTe92Mn2e5bqPTLfWBmUO9bOT4/xlStrxVRa4aiN5tLcn/gHVFP4L6x0
         4lTX87i7yZpXvMqy71MBhXGoCHjvEt9tc0wH78KJSL3ewWgtalwyRokMwvnwnAbiJjbl
         R2wDztSyMxB6utxmmXAcBq/YlcBWrgZNIH5HhuybVFpHtZrY1ji02KflJIq5Yknq/BBQ
         wCDBFSu7nycKRd413IbE1nRO4xPzs3bNounvAt2/1Bn+b1l8hA/KwDB3VE+rexIiNr1y
         Yg7wPAfSQIPvd4BBq+sSOVjiZuaXwmAbPI2OEym1cOj2Csvw5h+GC6wBsjlzoUZuXgYb
         QnuA==
X-Gm-Message-State: AOJu0YxXYLYA/Mebah6AJFbLTDxi8Vw3GkbgPTb0iwWm0hHUirbN6OgD
	rvFB9Q3qIhsMCuX+x8K7B+yEpFaT/VcsFrmZ
X-Google-Smtp-Source: AGHT+IHIneeEguymyNcX7Q5AOfOUbwInZrHPEts5XP3rQK5DpGrJG0kvyF/FPoQxuvGsAv7Nno8OtA==
X-Received: by 2002:a17:907:e8f:b0:a18:b240:915f with SMTP id ho15-20020a1709070e8f00b00a18b240915fmr2571288ejc.69.1702313184563;
        Mon, 11 Dec 2023 08:46:24 -0800 (PST)
Received: from andrea ([31.189.124.152])
        by smtp.gmail.com with ESMTPSA id rd12-20020a170907a28c00b00a11b2677acbsm5008366ejc.163.2023.12.11.08.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:46:24 -0800 (PST)
Date: Mon, 11 Dec 2023 17:46:19 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] membarrier: riscv: Provide core serializing
 command
Message-ID: <ZXc82331D+qWufsL@andrea>
References: <20231211094414.8078-1-parri.andrea@gmail.com>
 <20231211094414.8078-4-parri.andrea@gmail.com>
 <fc29a938-c34a-45ee-8c6e-3aa71964c873@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc29a938-c34a-45ee-8c6e-3aa71964c873@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_084626_949147_60C6B000 
X-CRM114-Status: GOOD (  14.62  )
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

> >   	/*
> >   	 * The membarrier system call requires a full memory barrier
> >   	 * after storing to rq->curr, before going back to user-space.
> > +	 *
> > +	 * The barrier is also needed for the SYNC_CORE command when
> > +	 * switching between processes; in particular, on a transition
> > +	 * from a thread belonging to another mm to a thread belonging
> > +	 * to the mm for which a membarrier SYNC_CORE is done on CPU0:
> > +	 *
> > +	 *   - [CPU0] sets all bits in the mm icache_stale_mask.
> > +	 *
> > +	 *   - [CPU1] store to rq->curr (by the scheduler).
> > +	 *
> > +	 *   - [CPU0] loads rq->curr within membarrier and observes
> > +	 *     cpu_rq(1)->curr->mm != mm, so the IPI is skipped on
> > +	 *     CPU1; this means membarrier relies on switch_mm() to
> > +	 *     issue the sync-core.
> > +	 *
> > +	 *   - [CPU1] switch_mm() loads icache_stale_mask; if the bit
> > +	 *     is zero, switch_mm() may incorrectly skip the sync-core.
> > +	 *
> > +	 * Matches the full barrier in membarrier_private_expedited().
> 
> There are two full barriers in membarrier_private_expedited(). We
> should clearly state which one it matches, and update the associated
> barrier to state that it matches this barrier as well.

Agreed, will do.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
