Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D00AC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 05:12:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D4F32086C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 05:12:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D2cAToP/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boCZY01F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D4F32086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dCM9H3Ru+IXXi5sQfz7mpMRreq06ky2atcRqg/GQ9EY=; b=D2cAToP/NsTo0EFmNcf87p29zB
	OhnU7BWWqjWscmEv2RIEB00TuXY1G+ym6vAHA4PojO1v3VmEWJ+lILadoG9hOl95kbauljZBtrAo6
	gPS9TCih7OXNMqsiKzRUqLeU35FXG+jeTMUCKXpxkNwbiqADTVWQfQjwT8GXIPPuPwdKze8IsWBkf
	cURVHl+BlJd+PQn5iYjxUVb3/+mACcvxPVAQvYn35uJSfy0vqi4SAgk5i7BrIgtXt1A3LGaw+G0rO
	nIs6RfVTDnCjjIKR/2XoURgVi/uqx85ft+eq+E94O7EAg+4C5Al2UAFF66a6HjWK2BXVNRE1jeZBV
	DLrtwGUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLLZl-0006ya-Bo; Sat, 10 Nov 2018 05:12:53 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLLZi-0006y1-Cx
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 05:12:51 +0000
Received: by mail-ot1-x344.google.com with SMTP id q1so3627031otk.0
 for <linux-riscv@lists.infradead.org>; Fri, 09 Nov 2018 21:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=SL5CuRiOvJyDY5N/G6cMVSUBSSVFS1sOGU9ssPcvbLA=;
 b=boCZY01FjydSo/c4J+iw/PiJC0cTmPoSOAWeSVmnzmsVaIt4/m88Z+GfF4SZl3QBi1
 Ckl/Qrb+KOOWUzNHdAhxDh1jc0DVn0Qf9WSPzuQaYl+URqKkllN2uQM6ET+325RpTPf+
 js+jGU+toj6b9e4VFAcxuiSxCTh93U0bnfNZ/fB9BEATFiYQ1i7f3WArj2UNl1Q/m3ja
 jBIZc5faC1N/Cr/TFKOhU3Mpv2PZKJ0HfeJmkcUbKuOcC2Wu9qYMQWGFjYRR1llkfcKZ
 1X2Wy5fKXdhJHQGoG+t7vmzqArAggntmNVcLAOye6MeZXO9+muIRgqBRPycTjvGaPB4Q
 LPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=SL5CuRiOvJyDY5N/G6cMVSUBSSVFS1sOGU9ssPcvbLA=;
 b=fGQoBtWsTfvKdAK2jooTlcZ2wUdKbXtpLCB5s/AOdcJg9wR/FI1d0tBiFEhdbUWBTt
 XF4EqwiuvDsNV+LvNMovoOC7To9kuUAXX/q/z+nIrWVJ/ykjY8dHLBPHcTSzpQwnTceP
 3yX+fYjERkToF+ZTJV4ipd8qCN0uG34KfThS7a7WvkrvdVKOm/+yNiqTz6aqUDaEA+E+
 XI03BLXOOIYWXjXKZjA87BmPAzpr2+OG5vbG1dsT6u1vLEsPnTjfkyfsAS4zRdwm0lrE
 q20xEpVQ12gx835TZIs5jsGq/Prg2VMezuR5uPaS0h51SNMW3tDPDdny2jBWVDmYVdwi
 D3zw==
X-Gm-Message-State: AGRZ1gJPLO5xUg11eqU3pkQIbt63fBL3whq0qeZdKEyLYG26RmQUZvDZ
 +QyQzdroXhMZCWBvCBG0f8KnV/lrqoC+54VK5wk=
X-Google-Smtp-Source: AJdET5eYwMexDJB+z3bBsKLUQat3OzjixNuTHXcWO720QtZSsETNCid0V3m3NSORy5YHK4wZRyNqruspVebp71tDEmM=
X-Received: by 2002:a9d:2ea9:: with SMTP id w38mr6403885ota.99.1541826756860; 
 Fri, 09 Nov 2018 21:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20181109031303.GA20906@altlinux.org>
 <20181109031712.GL21511@altlinux.org>
 <CAEn-LTpbzdpeWv8wqo_ptBw2t3Ypzzp0JcB+TGMG4NZbEGBnkw@mail.gmail.com>
 <20181109222839.GB2054@altlinux.org>
In-Reply-To: <20181109222839.GB2054@altlinux.org>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Sat, 10 Nov 2018 06:12:25 +0100
Message-ID:
 <CAEn-LTpYOL1-MYdgOXXvv8DmsGeb5-Syt+HZBcmwgyz-wVvB6Q@mail.gmail.com>
Subject: Re: [PATCH 12/13] riscv: define syscall_get_arch()
To: luto@kernel.org, Palmer Dabbelt <palmer@sifive.com>, aou@eecs.berkeley.edu,
 Paul Moore <paul@paul-moore.com>, eparis@redhat.com, lineprinter@altlinux.org, 
 linux-riscv@lists.infradead.org, linux-audit@redhat.com, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_211250_463755_88ED9BB1 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110051225.sVsi9tktfeJL6B5SSQe-G1Bx0cWKDATjwdK_EycQOSE@z>

On Fri, Nov 9, 2018 at 11:28 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> P.S. It would be great if you replied to me as well.
>

My apologies. I did hit "Reply All", but that somehow didn't
include all records from to, cc, to-replay fields :/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
