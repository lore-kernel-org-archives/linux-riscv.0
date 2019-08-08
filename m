Return-Path: <SRS0=gQVT=WE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E04C0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2019 15:50:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEEC92173E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2019 15:50:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o3FDusAV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Rjenc5zT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEEC92173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMNJWdW6SJFtHPw0jcc3FZmnSyliPTLhx/Jz5+Iorrw=; b=o3FDusAVEQL5mB
	m210lig77/oy47HqVqZ2GqcrtNJ+SMXc02ThEBq2tnfaFtnFi7KUHHU3FsubE72Hnk7MojxXuHbCK
	La3UwxTJfuwySRytxkoJwny7liVZSyzmCXbLG/RyFgaJq8fF42oBaJla26rt895jCLHv+aa9upKoS
	2ra+v/OFZXioD+dIg3JIM+mVT3iHerxPJfUbeJC4ol1tR7f2DUIMBGmyrZ8w/tDqRPNLl6/SWI2Ip
	xsj99s9vXOxv4hhTLL9gTX0m4P36auPp2W4kPBChcSqB0zQNIYkbiDDMpRhImyHjokcMN/0jXHjUU
	DvK9S9MY2qAjr6aEEumw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvkgB-0003D2-DF; Thu, 08 Aug 2019 15:50:15 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvkg9-0003CU-Ho
 for linux-riscv@lists.infradead.org; Thu, 08 Aug 2019 15:50:14 +0000
Received: by mail-ot1-x343.google.com with SMTP id j19so43804396otq.2
 for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2019 08:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=V04LJKvCA0wB/HmsqcSMs/4DuagqVihnyf8uqYLL87Q=;
 b=Rjenc5zTLUajzfiBedUaxjBiG1dhLJKjDLzS3UjIrusjrHXpf7CCE15NIbWxBhf6x2
 nvKbbMmWa6RH+y0ZDTTvg77tQLFGuhNysOD/LNi+gRJHzyNfnmCeNRAC2GBGNBYKwvkH
 5N8d26wze5KVYPDse72CjDU+ghlwcRp/l3VqNvx8ZGbaguxCbhKbpJiSp+K6FxJfgK7b
 SS/Fmvv8cDGxJyPEpHHTFTiuMIN3L1jaiNnLDgxkeZqxMJwaAMJwkjUNBjVJteC5wA7P
 LOqEzIFkuLAGC4F76tEqKI36IIfGJyTatKKeo17l0bIREcogBFOTbbhDG5gbK1LVQi9o
 ANYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=V04LJKvCA0wB/HmsqcSMs/4DuagqVihnyf8uqYLL87Q=;
 b=SQw9nDExKZSttBkT/m8g11POQ5ztfdycwrHEdYltiqMwiEySxmVxVDVUuJ3JFe+cdp
 liQaFX8tjR+C/bO1iF8Z6jd7l/2Tpd2N9+UpDECQZf/kHrAkTI0v3jxzlQ2UuvCpGe3x
 gkk6fV1/9gt4DN3IiWx+M3gBftlyf2+mJq0tvRMbUw3thtn7dgWf4ROLY7/eMBEl45ct
 mCJuj07rZ1OZ/OLnRqsvHtnj/QT9/HTE7U/IoGJuGmhzeilpDBqPEH31fsK5JRq5yaaj
 gTqG3LzWsCa2iGjJ/5zu8dPXfRQMLEpm6wknqqENDsgRfOpwF4jqlTbP4P40Q9riZr3w
 kkRQ==
X-Gm-Message-State: APjAAAVIaAix3jCQ4PUjQTbhO5oiu25YhfTXahru9dmUW1mmECrbcamI
 Gdh2xKIQmNCSwKWWRfVZiO3V8Q==
X-Google-Smtp-Source: APXvYqxcQzfpDuRczKMtOS49c3Tn97t1k3O5DW8Qp2eNDaFvhOHqa22tgIBfww5r1gp0e8ooLoY7ZA==
X-Received: by 2002:a6b:6409:: with SMTP id t9mr4933342iog.270.1565279411935; 
 Thu, 08 Aug 2019 08:50:11 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 h18sm73180520iob.80.2019.08.08.08.50.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 08:50:09 -0700 (PDT)
Date: Thu, 8 Aug 2019 08:50:09 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 1/2] riscv: Correct the initialized flow of FP register
In-Reply-To: <CAAhSdy0BNN4G270WJ+OqrFAv3-z9o2iE+QDHHo-FY0fqh5wGqg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1908080846220.21111@viisi.sifive.com>
References: <1565251121-28490-1-git-send-email-vincent.chen@sifive.com>
 <1565251121-28490-2-git-send-email-vincent.chen@sifive.com>
 <CAAhSdy0BNN4G270WJ+OqrFAv3-z9o2iE+QDHHo-FY0fqh5wGqg@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_085013_606073_D23D35C5 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: Vincent Chen <vincent.chen@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 8 Aug 2019, Anup Patel wrote:

> On Thu, Aug 8, 2019 at 1:30 PM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > +static inline void fstate_off(struct task_struct *task,
> > +                              struct pt_regs *regs)
> > +{
> > +       regs->sstatus = (regs->sstatus & ~(SR_FS)) | SR_FS_OFF;
> 
> The SR_FS_OFF is 0x0 so no need for ORing it.

That one looks OK to me, since it makes it more obvious to humans what's 
happening here - reviewers won't need to know that "off" is 0x0.  The 
compiler should drop it internally, so it won't affect the generated 
code.

> Apart from above minor comment, looks good to me.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>

Will add your Reviewed-by: tag - let us know if you want me to drop it or 
caveat it.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
