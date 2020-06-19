Return-Path: <SRS0=nier=AA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23EDC433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2020 00:12:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF95D207D8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2020 00:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CFCQGfKJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lfo+hRz8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF95D207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4IvmOEXU995/nnkIHpkUNgSHVYZli54q5t/36kQjlWA=; b=CFCQGfKJ497zgxHhe+hSpxxQK
	rTTjjyXETqTVUhqLIisz+g5e+5akRXIPLOixtalcmn5+I1Ga1LCEPaITIdgPduQPbBqx7dlddlYwe
	U6yTcITUYADi/ijJxUYZX63OTUSM3OUJvDJ3z6H1DaDkFSxpyHqjOcdEwB4T9a7Z4YT4S5C6iy3/n
	ZwXF3rxOH1qmJbHjm8vVJ5ydtWEHaOjnc6z6zlO4sx5xvDdMrU70Gee4JHazKzO8JKDQA5DU8sYhH
	a8o0HXgBKnbYlosHNiewRwDBweJJ5zwgQHDaibMLIQLE+l/URfty957611LBH2E9i1kWGVC+HPgjI
	4bGN/dywg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jm4dh-0008QY-Lb; Fri, 19 Jun 2020 00:12:13 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jm4df-0008QB-AL
 for linux-riscv@lists.infradead.org; Fri, 19 Jun 2020 00:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592525528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4IvmOEXU995/nnkIHpkUNgSHVYZli54q5t/36kQjlWA=;
 b=Lfo+hRz8/YccCFrWEmw79/zFStvb5R7ACfUUpSk1QHwA54rlD1bI/XHzjkd6rs+Y6CIHil
 IzoMvb6IRNyfbumN63of9Q7FaL//CePbCvTt4YlPK3R2HLzPlAvaTj7sSQ2fDQ2utQGQkL
 Pb4FdkXSlsNVBgkxINTjBttRQ0AEMec=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-hGuuKE7PMSesj_5PnFoHdA-1; Thu, 18 Jun 2020 20:12:06 -0400
X-MC-Unique: hGuuKE7PMSesj_5PnFoHdA-1
Received: by mail-qt1-f198.google.com with SMTP id u48so5757320qth.17
 for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2020 17:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4IvmOEXU995/nnkIHpkUNgSHVYZli54q5t/36kQjlWA=;
 b=sM8A2Gdrsr+nsCl1tfGMANBrDXKsp2YGXYRLCYh1blElGM0ydn0b407PcqyRdRZ982
 txNPCX6nDB7kqeyKGaHM22lsJcwKb2XllXYii3LKhD5bRSug1adl2SgvvScbXuoppCY9
 oI79YvrhH0bVaZ1aOkGFW7z852sMyIPR+AqAMKNXJpf9mY5oDY8saN0glrCg414pFbRr
 4Vuj8hr5cz6IB6y4g37kLvR1r2T0HiQyrdEXk6D8Xu5937e4j4SyeVuAGozdGyWthaKS
 qLP8IUZyEDO/T9rjRCAhd8VQfHke1kjGfwOKg/OX/fDJ8LhyaAFVXp1VfbhBU3sWlIVX
 KYPA==
X-Gm-Message-State: AOAM5334by9N7Cno9XkBKK51UeOokPsfCYrJ+iv2jq7LgpSHyQllIadP
 M79qXKuvKoGoVpJwtxTgU1+865HFSuyoZxywEKr8QpTMn+Gl780WJUeHTToPFHXCb8cBY21c9PV
 bNNy/sDe3r18V9Sd1gaQ90f8sXrpm
X-Received: by 2002:ac8:4d0f:: with SMTP id w15mr958028qtv.120.1592525526277; 
 Thu, 18 Jun 2020 17:12:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsaEDMK957KqZXyUDwEjV/HolMB1Vybv4Ttl9SBvvS0zGdpaROCsM+8lk2j72BNvujeZyNRA==
X-Received: by 2002:ac8:4d0f:: with SMTP id w15mr958004qtv.120.1592525526038; 
 Thu, 18 Jun 2020 17:12:06 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id 59sm3278161qtf.41.2020.06.18.17.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 17:12:05 -0700 (PDT)
Date: Thu, 18 Jun 2020 20:12:03 -0400
From: Peter Xu <peterx@redhat.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 18/25] mm/riscv: Use mm_fault_accounting()
Message-ID: <20200619001203.GA172559@xz-x1>
References: <20200615221607.7764-19-peterx@redhat.com>
 <mhng-261b69ba-d08f-4560-9c69-f4ece64a7729@palmerdabbelt-glaptop1>
MIME-Version: 1.0
In-Reply-To: <mhng-261b69ba-d08f-4560-9c69-f4ece64a7729@palmerdabbelt-glaptop1>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_171211_575568_0AAA4F1C 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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
Cc: aarcange@redhat.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, gerald.schaefer@de.ibm.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 18, 2020 at 04:49:23PM -0700, Palmer Dabbelt wrote:
> AFAICT this changes the behavior of the perf event: it used to count any fault,
> whereas now it only counts those that succeed successfully.  If everyone else
> is doing it that way then I'm happy to change us over, but this definately
> isn't just avoiding retries.

Right, I'm preparing v2 to keep the old behavior of PERF_COUNT_SW_PAGE_FAULTS,
while with a nicer approach.

Thanks for looking!

-- 
Peter Xu


