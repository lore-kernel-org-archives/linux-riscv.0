Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7149CD29C4B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQm3r+BrxKJKRxk++E4pWWPlq/3FXSfF8EbDEoZz5JM=; b=QWQoA+8L/ttArv
	5Dqs6EHhB0sJj3Mc2JZ7wVYOMGqwKBeRSnxCGRxkuZAc0ooxJ46ulzxpFPPKxeNMKp85oVcJa03Z0
	s+95necAw1OYmh1buVIjiVuZZwdtyrxL9+LVTHNCoPV0AFjm90rWMKkR1Ob5jtxwbZ9Ae8LVMCvwE
	D3sT9X5PF3AnGFb3997z+BDHpzeREtfthyeZedEp5GCTu7ivJRWzZPcWjsGsmV4O4Nc9/SYmQ+9Eh
	Y8AOZ+S8QdbO3GtLxw3Z26ZazgVYac5SblgjpmxHn3ESiUSfw1Dz9wM0RV2/7wCo+yhtBF5WRjDmh
	l4X23Av/xdcG6dPDzBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsLH-00000002X5w-3eTK;
	Mon, 19 Jan 2026 16:43:03 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsLF-00000002X5E-2BqV
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 16:43:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-432d2670932so3593438f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840979; x=1769445779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE5BjCYXuBdt6IRWd0lb2DWlaLa+Xld6lMou1p1B50Y=;
        b=iRG/RNFe+e5jaxnateEHwOEUNjrV0Wc7xJIENTyCiKpD9Zsa7WNsrHV3q6ZdJHrRjv
         FEJl1lSXO9SUpsBrbLO05SzCP+K6huOBJCvQjQAwig76vCCqTE0Tz3YzsbWwPPfsV9jo
         KiM/ofITPJVRg+TD1s6+Dn3h7WCJAIl+zt5flscVR4LXDY5GdOl6lwZlkA/q3Jnc9BYZ
         3IeMTzj8KGWv78nrDPt9Cc8vRk+fJGo7fkfofEvFbjcNxsT76EZX+zw6eBpqGdGph5pf
         Z7KKT4c+bgByqlwlled3jrKLhFfwJ46KDrsAzJiySAQ8ABiRLhLWvguFXgC2N/xMIsAy
         i2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840979; x=1769445779;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OE5BjCYXuBdt6IRWd0lb2DWlaLa+Xld6lMou1p1B50Y=;
        b=DuB8+ha0wB1+ezJnhPPyVKghZHFF+zqsd7A2y2ObM7040unu63i/0UNqyYjPWYQRqF
         d+82J++txybNvm++UTST20Mhi+vLkEN2KuQrnGUleidznCdUJG/2rKic5XJ17ZTrxsIT
         EJn+qmWs1IjxmNplorXq9xnjL11bDmL+KXAK/Ix0pWF8lw+zqryzFuwCYLCn2V5Ze85p
         VBtHdZyd5ipE8ACf03ZbYuONgOudPB3z0Wu+BRL0ZzLWPRDm4DXbKUGN4kBYBMhWtNt6
         KyxfQ55L/6uKDpHXRgBfUM8pTYE52L37xB13m5ip1mS79a3UwjbP+Czu/Du8e2SXc85p
         NEEw==
X-Forwarded-Encrypted: i=1; AJvYcCUkLXuqifEAdqT77gYjQXsdmw5Ey/qDBh/WVxSleg1yeb6gDhvE9hTAkGf5CPK7hkaEK++KhRnyDp0o0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuOzC1mqZycwIP9HDCJdINZ1o/PSqioJ92Q6j02wbS1NCOkA4w
	IjP+2co/Wi5oc4KHpDg+7E4QEEYIJwNqG7tFd+xM7xf9g3//R5pkTjTt
X-Gm-Gg: AZuq6aI6ppkAiIiqavi6I2fuElzOGQHjH/K6QWVvqZak5y+qVsF26+w1hNgVomJBSIa
	qXkItH9u9Pi8xzI8pUbEUOjzJG63e7csunu/ojbC4Ed9BeciVwL6s3LtHpc6+rKo42TqugwZYMP
	10DhdZ/b0MFVDXpelITTdW+BGPkK0giozDJ0vZDIZR2TSv6O2tx7TBwzzhOafnyscNNtjWapS/i
	zda49RuXwRqd4T2C7zNMPpZ5iPLsK3yTqFwLGVYhG+t9xxoGA134+UM5mMcUfdu+NlSzrXoYi/b
	/z1HQuBEFOkfdD8L3aigRTC57xg+znSqyT3AULcGA2xm3ni5m3UnILRIY219DUfLDOz2xz7ZJ7P
	PgVm3ZvC0OQmAVoOBvBhVAif+27rBrqJApAeDedBuw6lyJikOd5gXPiAWDb80IXmR8Trnxx72o4
	Zlq+j7y4jRM2t8ur3nwCFQ4Y26/B8m6LNWxjt5PxV30B8=
X-Received: by 2002:a05:6000:2307:b0:431:5d2:4526 with SMTP id ffacd0b85a97d-43569998dbcmr14869350f8f.19.1768840979260;
        Mon, 19 Jan 2026 08:42:59 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6dasm24493290f8f.32.2026.01.19.08.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:42:59 -0800 (PST)
Date: Mon, 19 Jan 2026 20:42:54 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Message-ID: <aW5exOoNcVY8EYON@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
 <af0d60f7-9566-4aae-a349-c01fe0220663@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af0d60f7-9566-4aae-a349-c01fe0220663@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_084301_610111_1853EBB9 
X-CRM114-Status: GOOD (  11.27  )
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

On Mon, Jan 19, 2026 at 04:36:43PM +0400, Mark Brown wrote:
> On Mon, Jan 19, 2026 at 08:30:44PM +0400, Anton D. Stavinskii wrote:
> > Document the internal ADC and DAC audio codecs integrated
> > in the Sophgo CV1800B SoC.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Oh sorry. I didn't verify good enough before submit. Will fix. Thanks
for pointing. What is definitely wrong from my side. 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
