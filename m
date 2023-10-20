Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F256C001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPNVPm7U7uNJ1UYMdWtEHZ2Fu+0DarHAJ2kT3ntP/GI=; b=tPzT3AriUX5XUg
	WkusvozCMuzFa06i+1DzRjo301MWHYkNkUx40ocYvLrCW7m53PI8me5ANfFAWXD8bE9WLgcORL7CA
	EANYyCTEyUCamrfaYUXXtALnLiTVHXXcyH2F13lt9l8mZbkZW8bIlFqozrH/D9OYpgp0jlfEpcujc
	QB4U/RJyM7z3ybgij1EDhP+xKMO1FZLhHIasmkqgeWuBixm4N9pD6ATeQ/Dsm7pFA3/+n52qumR8e
	0o7welCn1fsQUSYJemZPontUiHlmYWyv2swiQ5f0ZV3DD418/oR+t9PuZ+VGmefTvyUeAjMrl7sRU
	eVz5kb3P+XGb5K4mjD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmbi-001lTS-0L;
	Fri, 20 Oct 2023 10:19:54 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmbe-001lSi-30
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 10:19:52 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so941533a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697797185; x=1698401985; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iWVWVksSmm7aQ8JRN/GkgbGDZnVlaVxnvyhSePbu/vg=;
        b=Rc8Jz5I8O0EOlFYQp5XYrBnj08zAxyooXwMlgRxMR93xn0eyekbEhBQi2DeAiib+ft
         fVWmZijupj1b2iFHPfJ9rCbj1oiNpwgrjdd0iSRAkyM66lejoTgE2OnEoHVurOvn7R1m
         u62VKkCwKTke+32OZpw5vcoFBuHCM4RuV2GZAAQAFwL0+l2ZhhDikOKxqPatSSLziRVl
         dpn3UnQQo5FLkvASFypBj44/LfFOVeNONeyoaPbYi9sSEl7oYqp08cSN2sndY8R9pJOc
         iTxr7p6wiwdEQO6luEUFoyPoiv40jXLETiInEIbMHS3IhOAG5XZH3RUW5KrFJP78OzEu
         enCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697797185; x=1698401985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWVWVksSmm7aQ8JRN/GkgbGDZnVlaVxnvyhSePbu/vg=;
        b=RHq/AkFRQCYAs1RBlbwQjORSKcd2Hu5f/0sRuZ+Qj9j+lYrA9bYaS8mfNr4dg7F/ih
         0SyyW2SRLnH44OkXIHNpLBeZa8kusjw3FuGnAVHrCb/iySDevEn+eofIEqZQ5nwV4L6M
         6nTaqgPOhCohasaHUmTNy4ATQbJKLeH30B/3GGbLDyrk1Ilcz7yj/yM6MgjCb4tQfIaK
         2quQPd/43QDJeC1HIbNzWLM2wvrVI7+j1VIoiJYdpz9vHKM45i1XmPgsF2Qj3RhgZIYM
         3/qC3xPulIVcdyA6T/Xr5OQGxbUyjv14M7M4O59NtgFqr8o2a+ao0arT01P5+Ggtu4Ei
         Q9EQ==
X-Gm-Message-State: AOJu0YwvhCEfcaTCfsZBQekt/GWTQCpPLTZPZFdPoeWOeRnUkGLHrhrV
	J5YYFEym2fuo4i9iQcxQFJ8=
X-Google-Smtp-Source: AGHT+IEYDM00ovAEg4QMqc90xhxNrwrKs2WgwkwKPDXq88HvEkyFavLOpnaV4/ZOSlMz8RWjiaA4CA==
X-Received: by 2002:a17:906:7956:b0:9be:e153:3b82 with SMTP id l22-20020a170906795600b009bee1533b82mr912336ejo.17.1697797185221;
        Fri, 20 Oct 2023 03:19:45 -0700 (PDT)
Received: from andrea ([109.54.114.151])
        by smtp.gmail.com with ESMTPSA id e27-20020a170906749b00b0097404f4a124sm1212696ejl.2.2023.10.20.03.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:19:44 -0700 (PDT)
Date: Fri, 20 Oct 2023 12:19:38 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, David.Laight@aculab.com,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 0/2] Add Zawrs support and use it for spinlocks
Message-ID: <ZTJUOji+B+dDbMKh@andrea>
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
 <ZTE7eUyrb8+J+ORB@andrea>
 <CAEg0e7jkTOn1pjO=+GaiCZJ9_Yd2NcB1GMG=Q6m3-r0+Q0OjGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7jkTOn1pjO=+GaiCZJ9_Yd2NcB1GMG=Q6m3-r0+Q0OjGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_031950_996821_6AAB2159 
X-CRM114-Status: GOOD (  12.53  )
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

(Removing Heiko's @vrull address from Cc:, since it seemed to bounce, keeping
 his @sntech address.)

> I had a quick look at your changes, and they look good to me.

Great.  Thank you for looking them over.

> Did you agree with Palmer about testing requirements?
> I.e., do we need to run this on hardware that implements Zawrs in a
> non-trivial way?

I didn't quite discuss such specific requirements or hardware implementations,
but I agree that's a valid concern.  Not that I currently have access to such
hardware; any further inputs/data will be appreciated.

> I can try to raise the priority on this here, but can't promise anything.
> For me it is also ok if you take over this patchset.

Thanks.  Either way works for me.  No urgency from my side.  I'd say - let us
leave this up to the community/other reviewers.  (IIUC, Palmer was recovering
from a certain flu and might need more time than usual to get back here.)

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
