Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EDFC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:07:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84EBA20645
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a+goeAxE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qd6EsbSB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84EBA20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHt38AVp7QWvMU8EBHrbNXJAWMbUBEyK0pax9O22LS0=; b=a+goeAxEWdLzuG
	uG5iN6ITRrroIUS8qwj6m6OTOlhdoeWXGaefNMX/+W592OSBvLoKC2D5EJUhEvnstX2pX1lSyUpad
	yeNw4wFUc/THXRs/mp66XLRx2TBADFDCzKfaSdeRjJwslrXyyNA62k2yV3uY7nf6z3MdNj4vZPED2
	mdvOw9/F6VxiY9NjMTi9jdDyP1kiriPYh5Sop0JXJbMYUl7oZfy3MsWncuzjXZQgTOdcuOuP/48MM
	/bQwMyDTQgttSAfUSrkz6WzW7ieXJk/LLBnc4/WTHCWvucTo1As2lMomjGjRf1oTxRxh3p5jr9jII
	Io001dx0fWyS/p9MFrNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRF4-0003CG-6H; Tue, 15 Jan 2019 16:07:06 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjREz-0003Bh-4q
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 16:07:05 +0000
Received: by mail-qt1-x844.google.com with SMTP id p17so3517506qtl.5
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jan 2019 08:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KDgF9PsaUv/4dhalxqcFziQEKgteipii7Z8IS0EntwI=;
 b=qd6EsbSBTGGDsJMSy/5UpfE1iuOVk2W1zzLKjyLUDDtwqC5Bayg5AIT4JnWM2yiwht
 vU9Acgf5TJA7vaDjip6HSNT0NUnruWN0o7JAD7i/cBEz5qGJAl4nwjDqhZmlLT6K7gBI
 uzMW5sF0+/zAX9B/x4baGt4p9utCddBnZZf1Tuygf2GElbs6nxP9RCOfnwYw597E4IKg
 4HF+j6zB6O1jsmLhpFztDJMAa2sMZD32719Dm799yRAx61314N2OYxi9IK8fDqFnRt4n
 g9qLik49O2xZisk87wtSqEOtGpG+h5B3a2r2RBQxczowyFDjVMa0cHVxnpD+W/OORAO4
 k8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KDgF9PsaUv/4dhalxqcFziQEKgteipii7Z8IS0EntwI=;
 b=dsO1if/Os8F6hUc791ogMlkQ3wdMaH1nRYQ/1fav6ifO6VfT+w5dZPK7RJKYEmsuTP
 fEa1F9Gnxdr/TvpX5dR2tgCBDVcBV8T9DnAaRG69O/ZbkIvYQIb/S0N3onx41ZJLBpoj
 O282q5pT7jmuG3L/LGyICr2HTj1Qxo0dGku/pKuIR00wHmjal7psEuipakePY//cUJbB
 /ALs9uc4JbtDEljqmPBLX7aCN+70B6t4GqEfC9uW79hd1GOkp3qpyhLZtA/UZwr2eKsv
 j4U+S0E81+RRijRmXhmgMl8TDV2TZ3HeXc5SG4ARsk2r8byOduta6jQzGyOV+Xt7xkXh
 EApw==
X-Gm-Message-State: AJcUukfyluh0EIh7aJv6ebDTzVbw3DhoR+dEu2RO+uAaNx7MFg7csNRv
 sEbpBR03AJhOm0zSiF/1EmuB67Qk454TNd6Prqo=
X-Google-Smtp-Source: ALg8bN7lrTY5MGDixn+Oul/sWiaPULTT3br/uXCPR+mdfKRTzYD67uQCmjC8IYc+2nQtBDuy0eWIf34yvOM6m2KtxDE=
X-Received: by 2002:aed:27d9:: with SMTP id m25mr3396147qtg.303.1547568420020; 
 Tue, 15 Jan 2019 08:07:00 -0800 (PST)
MIME-Version: 1.0
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
 <20190115083518.10149-2-bjorn.topel@gmail.com>
 <20190115153931.GF26443@infradead.org>
In-Reply-To: <20190115153931.GF26443@infradead.org>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 15 Jan 2019 17:06:47 +0100
Message-ID: <CAJ+HfNigethi_fK-Cv5CskH9B7b+9Go1_qSVsGhvXnX1kbxykw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] riscv: set HAVE_EFFICIENT_UNALIGNED_ACCESS
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_080701_191814_4D8DFE30 
X-CRM114-Status: UNSURE (   5.48  )
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
Cc: Netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Daniel Borkmann <daniel@iogearbox.net>,
 davidlee@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Den tis 15 jan. 2019 kl 16:39 skrev Christoph Hellwig <hch@infradead.org>:
>
> Hmm, while the RISC-V spec requires misaligned load/store support,
> who says they are efficient?  Maybe add a little comment that says
> on which cpus they are efficient.

Good point! :-) I need to check how other architectures does this.
Enabling it for *all* RV64 is probably not correct.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
