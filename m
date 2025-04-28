Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92686C369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 21:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3EtYyjf4gdK8U1ALU9JtsKtV1HrvZ6nEjneljQazYI=; b=U2mUZeQ19mRWGT
	H01zMQx+6Z8tasvbgHSGAEDLdrt9lX1fK7nnlrdxZz4OGZrgevwGA+UHtCGojQnWOLEztY6CTH8/h
	r0TQNZHWEpQxgeOKtrEgiD281/OGK5Mk5qUA1Iwu2fsQcmMnNtAi2gC+Ou4HZ8u3eHuFegHn3sNiB
	I6Iw9KHTAVyA1A+Un0+Da+Ysx/HCS/V1SxPz22zwgYKBAao2HHtxza0kp72KPzkKuh1UjmW3I35Bw
	I7bsQ7ZO/stvHdy1kz5DfbFih38vwelLcscp+t287mJ7U+eBY+P+Bejpay5UcZjbpW1wAXpIAWx9U
	h8tFk4mrHol8P4F327qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9WR5-00000007fh0-1l19;
	Mon, 28 Apr 2025 21:54:47 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9WR2-00000007fgO-2bLY
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 21:54:46 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-736c277331eso6027506b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 14:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745877283; x=1746482083; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7PrFUrYVebeKySS/v6ZqS0K5DEgZAx8oNo9TFzTB1i0=;
        b=rK3kz/vw6tmPlciF6D0aI6yDkXRm9YJt3D+1TGDEhh3JaRCXgfE8Kea7GcXwJxRqL8
         cMX75W9P14E+fLqwyeGGIIxzB5uAsYLJVTEvg5l4WYhQVFxs30Q7vu6BDlAlajp606za
         zoxDF/5Wf6wrWrXUX4I9tRWqFr7LmWLA/RzvUPmAc1NP/rhVAWrS75QJy4HVRzD8nZhf
         x8enSLONJl551UT6vn1IgLZcoraE/JfN2yi2MFif3PD0CAflvQ/a9Qwq/mP3x2YenGsp
         SYR+VHXNiJFZuCMVtrerKLM2xTOuY8JmWfwNwOQFV1PFeMtCLZkctqy4dcWSWQU/fd2N
         yFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745877283; x=1746482083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PrFUrYVebeKySS/v6ZqS0K5DEgZAx8oNo9TFzTB1i0=;
        b=FlSdrO6jBElL311D91kgFEPEUoCcWRF6uNT3GSw043X8Eh1pMsWJj+JgYEZEm3m48B
         4VBxIYnTXgtUaG12geG4P7fhExJbR2NBlfkBgn3GNoS062RLKqmTplnmL2MvMj+iaoM/
         uEJlVpLTxjXdL+wP1BtZuhJF88/aO/MYTYVdyVdaTb9hkemtG4QWZMwVDorblGXJZvmK
         l5vau04XJAzzU5Rwdw9jMRhnAib8CAg4hCelszmPjO78bj76gYDCYS/J685isrDWHPdi
         TKv24hjZiel6lbaNTHTD56mEfSr3j4nopXVNF1nJdqvh43470+CBfe76bxfE+aTBp+7g
         EsiA==
X-Forwarded-Encrypted: i=1; AJvYcCXgspv6m/d2CktCPjL30pk5DstL3ywgXDi5+NmPAM2nc1fICafz7JyJStqKFFhjDRU3iapCWQ/QN5im0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLZkoXHmt4IViEUJertGixvHlI2w8hd+7ODyZC4cbzXdLYYeOS
	3aBZVP1IfUZKoybDuT4+xsJ+QNoxHjlxbig4cduxjixVIEQQJJBtnSeH1P20pyw=
X-Gm-Gg: ASbGncseehOaLMT9vr2rhmu1my32wHWNBE8n97GcqwjJC/8jR+d6aA8hMwTmvQ5UR8W
	BonUr9G/ca72Ok0TBs8Ib3KRnM0WZnlr6wtr9siGmj0Yc/8f02WSGfZFTKuizHocp1mToL0yN+4
	ScUkwCL9DwA9v87FhUGUvNs3gr4tS8TJ5KPuC+ufNO7bns9aJXHe/YHKlrL4jmK7B7Op0eWjgBD
	6yolbixA/T4GqetV4Q41Z6bD4VLZZxikVBHh+F5APueb2CqJS6AaKlHzn9bn2uHJfrRnHmyYdix
	vpwr2xFDQnAxwJwm/3rcHS0lovSbxca3ll4f
X-Google-Smtp-Source: AGHT+IGWT3F9rzHKTZtgpify0Emfhlu0qposGjyGuLHhHiqFNXMP110/wH5dDuLcBSTkm/pZT1KRBQ==
X-Received: by 2002:a05:6a20:9f44:b0:1fe:61a4:7210 with SMTP id adf61e73a8af0-2094f0854e6mr1162679637.2.1745877283395;
        Mon, 28 Apr 2025 14:54:43 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:5842:f05a:498b:82d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded547sm7735083a12.69.2025.04.28.14.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:54:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:54:40 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Message-ID: <aA_5IGGvXqB7v_EA@ghost>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
 <87frj613kz.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87frj613kz.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_145444_926144_F39A508A 
X-CRM114-Status: GOOD (  16.56  )
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

On Fri, Mar 21, 2025 at 10:22:36PM +0100, Thomas Gleixner wrote:
> On Thu, Mar 20 2025 at 10:29, Charlie Jenkins wrote:
> > Similar to commit 221a164035fd ("entry: Move
> > syscall_enter_from_user_mode() to header file"), move
> > syscall_exit_to_user_mode() to the header file as well.
> >
> > Testing was done with the byte-unixbench [1] syscall benchmark (which
> > calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
> > x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
> > s390 a 11.1328% improvement.
> >
> > The Intel bot also reported "kernel test robot noticed a 1.9%
> > improvement of stress-ng.seek.ops_per_sec" [2]
> >
> > Since this is on QEMU, I know these numbers are not perfect, but they
> > show a trend of general improvement across all architectures that use
> > the generic entry code.
> 
> This looks sane now. I've bookmarked it as post-merge window material.

Has this been applied somewhere?

- Charlie

> 
> Thanks,
> 
>         tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
