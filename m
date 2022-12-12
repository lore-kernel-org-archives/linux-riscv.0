Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2604AC00145
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ky/W7UVnnE98BEw9zlT6O3NgHJKuLkPtNAQbv2OyNoY=; b=0JmGPwZJY/GaGi
	UWG+xizWrxMK6sKDCUG5MLzDlvI3SSiYsjNF0pC5PVNtsaYhmIKxE0cbDVmDBjDVzY3FjocZEogpr
	w55/S/hYTZS+MvWjl68el1iKWoVyXOrcp+yW0eiQifCLEiLqgXws7FujMusvvaTNZA1RDzHWfvZDA
	aCUPPN/vER04H95yneKQZak40DkcTjeS9NKzvmWxY9RW/HfHBNUp1V7RM3RAhPdu45O9xF62RjZkk
	4M5cP70yR9Ke8BZrSqo7aj7blRal+pvYwA4tl1qvL1lRwU3aSbLCXP/spZf8wJcMAKhv3I2CviDdw
	kDyeLp5M0SUzdtNDlqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4jRQ-00Gy6H-2l; Mon, 12 Dec 2022 14:06:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4jRK-00GxzO-IN
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 14:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670853953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uajs6U0hhaeyeVDe/bjj7cZ7ryR5qrPd0pvS+U5SVuY=;
	b=huaJisGAtMBGCNjFOKySkT6TYP9/VAy8gCz9oG1cchBXuUidzijIThbvfS9Eb+31NDeF95
	dFcuXQuySXCE3qiDUNoHITkLReaUKkLyzfJWXSac7pZEbBSDICftmrSUAtYVq3bxBunM7F
	UmpW66zzQiH/TbYWIDIO6NxzKQx4A+U=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-IGKEduMWOgqVyD4Thob_yw-1; Mon, 12 Dec 2022 09:05:52 -0500
X-MC-Unique: IGKEduMWOgqVyD4Thob_yw-1
Received: by mail-ua1-f70.google.com with SMTP id h14-20020a9f300e000000b0041878808d9dso5205782uab.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 06:05:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uajs6U0hhaeyeVDe/bjj7cZ7ryR5qrPd0pvS+U5SVuY=;
        b=PYw32YjiZhGVzqTRJFEHT3wkkVncvj5Kd4CvduirNxeRe686/PHTZv0T59srUS0xjn
         xksawUg3J+6XXz7Zc93RRUk/bCRNfdLYA35JIffLJ4w3hIHxsYBZ/3EMWA9uSaREdZUI
         w9gLeOTkucz/vAmE1EqHwVd4eeTDiU5qQ3eWXfXnJHpppUTV9XEQJQMqzlx5gUMVJFhh
         LKmiw+P9Wl7i4u9kVeWcUAHOBI1DMDlkwX9e1rN0Q+VKnR5O0e+5X+Bk3mSRD5xB9H2I
         rsRxGmXd0C28bfk8RTdEZxa/qRKfCh1eUWQzmdw9szzwwRNm4BS9uBfil/zXtDQo928x
         ioGQ==
X-Gm-Message-State: ANoB5pl+JqorEEXXOQCRbN7uWR1IJDB+97AdoTcoSeqJADZzGpNR1MX3
	R0ACICvUswc2CDIlS72XKIWoopmVQhMpkAZDrhKCTu5zAQ+L0gC5wg72Fuq2gVvkyj6INsOlRRt
	Kft9kG8E0+3yjToG+t2lzfk5LpTinsfLJmLMkSD+EHEz2
X-Received: by 2002:a05:6102:2221:b0:3b0:4a83:954d with SMTP id d1-20020a056102222100b003b04a83954dmr45823963vsb.62.1670853951801;
        Mon, 12 Dec 2022 06:05:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6lVCd09X3oDho+YhdWpmFYyrYm2BN0E5ykxJQrwbC/h3XZ0H9Sx+5sJzH3tBlZC71g1FbsAu0DSKsAhtOSVYM=
X-Received: by 2002:a05:6102:2221:b0:3b0:4a83:954d with SMTP id
 d1-20020a056102222100b003b04a83954dmr45823957vsb.62.1670853951532; Mon, 12
 Dec 2022 06:05:51 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy0qihfFCXTV-QUjP-5XiQQqBC4_sP-swx77k6PC3uTmmw@mail.gmail.com>
 <CABgObfZ7Ar-t5m0+p=H1h0_bk-dJ5rYSVRCo6ZP5Wa0Qva2sLQ@mail.gmail.com> <CAAhSdy0c5_oa27axsG_YnZmJqoTVXAeR2XQ=sqvLtBMaB3wB1Q@mail.gmail.com>
In-Reply-To: <CAAhSdy0c5_oa27axsG_YnZmJqoTVXAeR2XQ=sqvLtBMaB3wB1Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Dec 2022 15:05:39 +0100
Message-ID: <CABgObfYmusq1LPoWCexYsP+=2pYLkfcNzRchJY9UmG_ktE-CGQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_060556_688646_15C9E22D 
X-CRM114-Status: UNSURE (   7.75  )
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

On Mon, Dec 12, 2022 at 2:08 PM Anup Patel <anup@brainfault.org> wrote:
> > It's a small set of changes, so I'm going to defer this pull request
> > to the second week of the merge window.
>
> Should I send another PR ?
> OR
> Should I re-create the kvm-riscv-6.2-1 tag ?


No, for this time it's fine.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
