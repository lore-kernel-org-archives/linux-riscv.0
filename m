Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD8EC54EBE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 07:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ba0f5yQ6M7857Xp+GMsgxiojjP3lpQkPBuGIaym+zc=; b=0jqbeE/T8+khFJ
	f1zxG4jBxUMkJIHbdQn/YUj7TOqru8hnS9h724r1rjeE0a9nG0TsQ6eK8LkSdKL96Rlc0Dbdw2/Rx
	N13YMweYzxyPjHHRzAyYyoRyHR0+IsAuigYTPe9PJw9nig03FUZRcq5bNS9pWKY+72/a1LYi4xi/s
	QHktyzztdq23MAZljGndEi7dd139TBY/6ZlZqR/5hEqk6rCo2DDBsc6TIKFNtVvNTm5BU/NG4ihRt
	EeU90fjrs51TKtgsN2XI73b9LCa4BOz2f5ErD5tg7nseVaO3kWktwodoysREWzSrcnSBxk2aotv8S
	nQEKZajcubZ7kF3PIzGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEhX-0011Jc-1h; Fri, 13 Jan 2023 07:42:11 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEhU-0011IV-9I
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 07:42:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id z11so30093652ede.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 23:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nsdFs6pzrliWUStfNOl1FM9T1mI6Xi1uicxIBR+DHR0=;
        b=bxg1JS8fp+9+/+7/09+z6yzY2UJpMRs52IaTtZs4uChAsUtbFr3/5xjnZ2k8aPLFrI
         EC7tEE24pKzHsigOYR9z4BFbxC3/iEJXOK4WREzE3Z5Tcyny0ZpGcnLUIEMwUotRlpcw
         lZM6FwML+lEJGVYZbFzIBaHIBU3qh2tCXZauGMuuEutvJfiZlhEMsdpTJct0SRkdCtng
         sarYsRN7TiRqDEFGwgYGG3cYJ9RZYwCGxxBJASK4jBlhtMTWrFsmRl8cyIlCAj3WdBJj
         Lav4o1Cr+KDqYPabyg43TRivHDBRAqpf8rmkN2uM/3MbrhNm/ZyVGTnJiuNAXW6Dlo1s
         exyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsdFs6pzrliWUStfNOl1FM9T1mI6Xi1uicxIBR+DHR0=;
        b=ooKydAFzGhyKQSIQGBhRadJLvo+AgpKV4egXFVEc1r2fdqwf2lwk+S0ae0S/Fl7/wO
         vrkQTTPfBqNrqEkwJxgtDzXrHO188UjhlhGlGyIU5hTP7Ivq3a8ErmJf+eMaWobltPtI
         U8+r0fqEnp03kcBYccNa6lZh/CkYdarkmRYzZ8qwFunF5uaG9paB/r92t51OxhXY7uIG
         mGsAwby/1meUc3Lxkc81SvmHh8eu22GFzVXwGkAlgGwDaoTmWqvWtCOgHjy5Jzv5rBRa
         Tu1pP0rpPYTLnTaAucB1BMwd4vuEDzCwWFZ9m8f66IPcLRXyI6KhN4hSiBQuX1Vqb3qH
         23iQ==
X-Gm-Message-State: AFqh2kpUs13JD/inq22riz6TJvb1LRK9ttvp4AWYhrQAv3AtUq84bOg2
	LrmlIfocpSRaPKOPW3Zxs9KnCQ==
X-Google-Smtp-Source: AMrXdXtm2abt8YC1BnrO9ZablHgd7dzlkKrmOBXbgyyxB4FSNCxnE4tz+rAhG7qm5jh2MQ0HncQ+xQ==
X-Received: by 2002:aa7:c393:0:b0:499:b604:4de6 with SMTP id k19-20020aa7c393000000b00499b6044de6mr14363452edq.25.1673595725444;
        Thu, 12 Jan 2023 23:42:05 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l15-20020aa7c3cf000000b00467481df198sm7904083edr.48.2023.01.12.23.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 23:42:05 -0800 (PST)
Date: Fri, 13 Jan 2023 08:42:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 04/11] RISC-V: KVM: Modify SBI extension handler to
 return SBI error code
Message-ID: <20230113074204.p3wmeer2o3penunt@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-5-atishp@rivosinc.com>
 <20230112110444.jjbmgslr6dspxwbh@orel>
 <CAHBxVyEyMdk+vQ5wTgOF56UJs-zLtkVixDxXquTjoLyV6Vj21Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHBxVyEyMdk+vQ5wTgOF56UJs-zLtkVixDxXquTjoLyV6Vj21Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_234208_342024_77423586 
X-CRM114-Status: GOOD (  15.92  )
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

On Thu, Jan 12, 2023 at 10:47:13AM -0800, Atish Kumar Patra wrote:
> On Thu, Jan 12, 2023 at 3:04 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Dec 15, 2022 at 09:00:39AM -0800, Atish Patra wrote:
...
> > > +      * and forwards the error to the userspace.
> > > +      */
> > > +     if (ret < 0) {
> > > +             next_sepc = false;
> > > +             goto ecall_done;
> > > +     }
> >
> > Shouldn't this ret < 0 check go above the "Handle special error cases..."
> > block?
> >
> 
> Why ? I thought if an extension handler has both utrap updated and
> returns an error,
> user space redirection should take precedence. Let me know if it is wrong.

My thinking was that utrap cannot be trusted if the handler returned an
error. The handler may not even have had a chance to set it before hitting
the error condition. IOW, we should check 'ret' right after the handler
call. If it's < 0, then from the caller's perspective the handler didn't
execute due to a KVM failure and it should be reported to userspace.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
