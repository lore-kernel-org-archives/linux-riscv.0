Return-Path: <SRS0=cKew=DB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26741C4363D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2020 14:56:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF455206C3
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2020 14:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uVf38sXY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UF9OPLc7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF455206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	Subject:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YhFRAagXqf/hNSnMZhYyTXT1JAdVF+g9neGXVk1GI5E=; b=uVf38sXYLx4/2gUTffliBGPvN
	VakMF1bzVWXgoBWilLm+CWyPRWBS0HwFqUU+AsmgPeI08zdG8cfTiInRRNXFZe17AVRiCiRHk8/bi
	VSXN6I43ZID9m5tx/XaNzZ075ATu+OtO3hcfDHlnvZDssOk+EDl/ekKgIowAiSuukeww4odBC4Mj7
	zuHbwMBbMJ7Flffcse9xVqFa153UM5aXpDnUIMs99Y6GQOQwlq1qVm3mf9WQnDJxQn53TK0vK21A1
	u8wzU3gFCXhxrwOU0CV5sunyPmxc8Gwz2dMRI+cNbgzpDJIPI/wvjIg94skh6bTcfRg+EA3Taje7N
	xEVwIrWig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLSf9-0007r8-Ek; Thu, 24 Sep 2020 14:55:59 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLSf7-0007pQ-C3; Thu, 24 Sep 2020 14:55:58 +0000
Received: by mail-wm1-x343.google.com with SMTP id b79so3913463wmb.4;
 Thu, 24 Sep 2020 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:subject:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cxvl2MAleQcMTiG0WSrWtQ8ZVgZ+BIbKryf5RRhV2Ew=;
 b=UF9OPLc72qF28w6y+ivkNrmXc5fop6lS4sjwHWDd9rzAFwH/YxcaJyc57rdANGsIN4
 rYSEqsboWQ/6Rad3EEZAYH6sJkptJizRO8lNfWk6XYA0XKnfcTxYON3ug44BYQg9EMER
 pVgAFcgLfPn4DVLiJ3Hib3T01PXbwRe+Vojn0wE3Yok5pMEIejrXlJffXDd6qKuKAg44
 VtKof8h0scpGdPAcmiLAwTnzsODA8lRMiZPWSwQRsP90h1aLFuABF5VbrFI/sWnrFX0b
 uEmRRAQsmZaOnouVl0mGoQ3uar4fcGrE+qSzboc3C0J0BGGDyYXkJ66tiP5wIrQLNFZH
 wH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:subject:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cxvl2MAleQcMTiG0WSrWtQ8ZVgZ+BIbKryf5RRhV2Ew=;
 b=LA4TLe7fcCPECHQUjwWIIBd6A77abu5iPH26SsiRtq3WMkKzbt4E5DUqBuI1nnsadp
 Mu/eYiJRfBZl+TahqN66JeXaBEVa/fipTw2lg691xSXdvt0KNWfTR9ylbzVy4gr/5jTW
 QBEVF5NB64dyqpBCsqPIa7EsF4dlI3hmM9Sx7ILK41eP9FkZe8t8uArfBaEGvB8u2NX+
 NH38eZAoKlb5tCOSw3Ibe1Yg+7/ZOCxUAl/CIJCxhd5TjqqHteLWC3xpr/5Wai0RbH6F
 xNCntinRkvDa4rc5KWqtd4wENVZAJy65f5W+pUIrlaUYlIU5HkIVQhsQPPp8ctnkqque
 wlag==
X-Gm-Message-State: AOAM533zou3VJE01FCc+srrY6DQtMWLaveuc+19RrJNOJehUtEDAGDNm
 vBElm+U2819emh+rAmXbx4g=
X-Google-Smtp-Source: ABdhPJwA7ld5rBdiNBafXko+QQDLwn3uoHLR26xm9fJkwIdPYX0Ec6468qIEwFlntmVrZ1YEq/Neew==
X-Received: by 2002:a1c:4b17:: with SMTP id y23mr5136571wma.162.1600959354790; 
 Thu, 24 Sep 2020 07:55:54 -0700 (PDT)
Received: from [192.168.1.143] ([170.253.60.68])
 by smtp.gmail.com with ESMTPSA id h76sm4156994wme.10.2020.09.24.07.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 07:55:54 -0700 (PDT)
To: rppt@kernel.org
References: <20200924133513.1589-1-rppt@kernel.org>
Subject: Re: [PATCH] man2: new page describing memfd_secret() system call
From: Alejandro Colomar <colomar.6.4.3@gmail.com>
Message-ID: <efb6d051-2104-af26-bfb0-995f4716feb2@gmail.com>
Date: Thu, 24 Sep 2020 16:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924133513.1589-1-rppt@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_105557_431750_F971BF81 
X-CRM114-Status: GOOD (  11.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-man@vger.kernel.org, tglx@linutronix.de,
 david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linux-mm@kvack.org, will@kernel.org,
 linux-kselftest@vger.kernel.org, hpa@zytor.com, cl@linux.com,
 idan.yaniv@ibm.com, linux-riscv@lists.infradead.org, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, tycho@tycho.ws, linux-nvdimm@lists.01.org,
 shuah@kernel.org, x86@kernel.org, willy@infradead.org, rppt@linux.ibm.com,
 mingo@redhat.com, mtk.manpages@gmail.com, arnd@arndb.de, jejb@linux.ibm.com,
 bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org,
 paul.walmsley@sifive.com, kirill@shutemov.name, dan.j.williams@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

* Mike Rapoport:
 > +.PP
 > +.IR Note :
 > +There is no glibc wrapper for this system call; see NOTES.

You added a reference to NOTES, but then in notes there is nothing about 
it.  I guess you wanted to add the following to NOTES (taken from 
membarrier.2):

.PP
Glibc does not provide a wrapper for this system call; call it using
.BR syscall (2).

Cheers,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
