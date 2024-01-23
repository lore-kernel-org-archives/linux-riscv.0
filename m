Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AE8C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 02:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=R40whCTzDm81OLpieOWwbhEF+cX6XPMsDptTlHqFCis=; b=2TnQGIDrIa4+SO8BZ2fCu6KzL/
	vDULEqRpt1VNvAFgriuuMxMKnZzaqCnKegKw77AgneM6K7xkmKdvuFjv9cjMwrVTYGofO24KTC9ah
	4af3GCoAEMIQwYpYQL0I0PoLop/rjlsrWo8/UcHHPLnQJzqZ4IcTGhpcJS5QUef+LR5OB94LRhHdE
	sMoczVfP4+Up1PLFCckTJ57VA3hxYbfXmIbAreVHss6pwbMUMu856Kz5ZA10+g8bmd0dGywbQK8Sz
	DPHp08OmPpzSdKEASH1EzDQMMl0TAB1vnxarW8vaNdlfszda7GvKxWN9Rs8Ozm0evmehrmg1Cr2mW
	AAhpIiDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS67x-00Epyp-37;
	Tue, 23 Jan 2024 02:03:01 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS67u-00EpyG-2Y
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 02:02:59 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6dde290d09eso2637345a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 18:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705975315; x=1706580115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91+TcT5wXxz+6ZAfNQ55hsyl7IKvd4OOiIR66plDFoI=;
        b=R3ilj+qiHTH+7Bqk4zNf4DPQEIVr0QK+WCp8HryQZYZcVJwrGEIiinsK3KoLGS3yge
         GkgHx5a+cU9L0WABjjH7K0e/13sqZ/SGYZtQTAtBkeXzDgywNuyzKAzCX17kQoafItOn
         iX6Kvim16jO615ilyHx9J6E4n58gq+c76Vt7jkdySZk5Z2UmULoxiTY6zmBgftRYiExc
         Ss6Pp2GL1A0kaAkVRCrR/ukMjFxhMw2V5aCW5RJZZMfc1wuBfxo4I2WCSSebPSCb0AYp
         2L+kMMoD8u3ce3qhJv/asvet6he8e+KYihKzwBini6W8IecbymDZ9rOwvHqMynWDqWu1
         c0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705975315; x=1706580115;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91+TcT5wXxz+6ZAfNQ55hsyl7IKvd4OOiIR66plDFoI=;
        b=NCgBO7QSs1hgFz+e3Ye7cH5PsDI7Z0ajP3JETEskL7EfhuZWL5fnEkUZBwS2taFPDX
         vri3R2GciQOPz89BNWo1TsDd69AJqzzN8JsI99mRVfNrJhkOd5ickV6DTsjKavk1s3Vg
         CAfZ9KLkOVOm+CsB39sSRVgaSDxnEMbTljWMnk3doQg6k+kiDq2x0sXxSGaqDDhhr9G2
         K3WsUaXzFQ/lZqWZqiEd2MA0MXP+xQj0oJXdmFfNUkeZysBLPplnF9ZYIVQ5BY6SUINF
         kGZaAdauE0jrXgEweKYvda9vj390jW1Po668PGHtZqAmR+fxrLgA+9VO5tY8tYRO96rq
         hHcw==
X-Gm-Message-State: AOJu0YwiXRTmG/D0hTBa6N888iA/+grwo15WCzjr0A5DgYEHdjAUO7R6
	2iOBqc1a041ZB2vjE8KD11VlxdAW+9p+yzRxzwG4NJs1gVEa7SaRTQK6jNDn2w0=
X-Google-Smtp-Source: AGHT+IESW90AYBQosWUrRQ4cqcsVqGDQjIXW7uRC4UGcFqiR9D5hAMz3HmcEAMTUdoKOolEo1uL7Rw==
X-Received: by 2002:a05:6830:3114:b0:6d9:d786:b260 with SMTP id b20-20020a056830311400b006d9d786b260mr7024435ots.60.1705975315530;
        Mon, 22 Jan 2024 18:01:55 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id j19-20020a635953000000b005cfbd4b3cffsm5280084pgm.16.2024.01.22.18.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 18:01:54 -0800 (PST)
Date: Mon, 22 Jan 2024 18:01:54 -0800 (PST)
X-Google-Original-Date: Mon, 22 Jan 2024 18:01:53 PST (-0800)
Subject: Re: BUG Report: Some issues about vmlinux with emit-relocs
In-Reply-To: <mvmcyymxh8f.fsf@suse.de>
CC: suagrfillet@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, anup@brainfault.org, alex@ghiti.fr, Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-b104f14d-b712-4ad4-a981-b38c07b4b106@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_180258_828031_1EBB042C 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Sep 2023 07:47:28 PDT (-0700), schwab@suse.de wrote:
> On Sep 13 2023, Palmer Dabbelt wrote:
>
>> Having R_RISCV_NONE in any binary is a bug, it's not a real relocation
>> just an internal binutils thing.
>
> That's not true.  It's an official part of the ELF psABI.

Ya, sorry, I got it mixed up with R_RISCV_DELETE.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
