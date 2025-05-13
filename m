Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5FDC3ABDC
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sG3TikGIkE8UEpJgJQI1ESGCOAGLNZdlB5OnCRcZsJ4=; b=J4lMLTEEh4mfZY
	6nFlrzOy/Ey3oNDZgjedAJbfuhWS8vsvpkvHqMmgpVpm2npQL37jOJwP+pDYL4ithqTLSL8ukpYSB
	ughiO8tfe5lPJrqxb/Wl/migzffXfNMcvoOIvibdVYRSIMVZc8luPDAJFJNzCgUObOzPqkxNN/W11
	UdtXoNa0Sex12RSwqxLEhwRFUI+N78Lr0ZKIAcrja4ckiBKUADl2rIgmNeyfBBXLFmm/4VYJJRaVO
	gtYRv937wwAdFyk/FLBua1kS8IpPbq+PZM1cK8vKi2WnwHbNs3Dj566jHLKgajgbSiT/PjAZIJaPS
	W8ks5BlIqoDMGgvXci1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmYz-0000000C1j1-2rhw;
	Tue, 13 May 2025 10:08:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmYO-0000000C1Sa-1oEi
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 May 2025 10:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xxTCWdoxxph2uKRlpdzs8tMyten2c/Vtkg5n7lhhiZs=; b=q9X9R8oYCkKvqOso0IdZpM0CIW
	XXfKRZrH2fp+canPQYBwpTWVbPsv9OiKzypu89Nup52G9hNE/PvFkh+p1bzVnTkHa7iTncKu6d9sE
	vNMzhuN2NxowZfn7tJW/D8cGCpfcfRie2SZ4tETSE0KxuZFJyctUVh8IEExBfej4gm9MCcp6ArUiX
	ecTGFYpB4lAgBWgo887BpRJOLqWo7BcYIErW635ozrV1OqyFTeyEgQzAvf4sHQr+jJ1aYs/3HyG7J
	s8a9M5nih+/6zzXPTSEA5kV0TlhM7dgs8tgdtMS8jWCBcWY+nDrFzl+ZKj36IdnNSYq/Dswm5y32S
	iNt2y5yg==;
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEmYJ-0000000GvIn-0dK4
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 10:08:01 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-476ae781d21so64397311cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747130876; x=1747735676; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xxTCWdoxxph2uKRlpdzs8tMyten2c/Vtkg5n7lhhiZs=;
        b=TYR4ObwexX6n6umnyFcwMX1hn0pjHL9V7/llbPmJVSRcvFLiAo2ocbzw7AfCX8lbTH
         ExSkYN6J+FukQsqssHkA5Iiq2EOA4gI9QCh0oBUN5e5RUfvKoYF2rovlGZChK+3O9dhr
         lkvqKW0h/dRi7DrFXf/+Stlegga34MFmx9knVNRT1U3TolEnu6mw/2j+aj1c9yLq9pcs
         itU5z0UppXvCCcAPv+DU8SpGQD/TSp5V4VakCIpAsxKVhj66X+FqDQrg3uU7F+WTykBr
         ham4XmkvBuJjfshWkyfw+ggTu533+1ecDNjGMizan4oSpnXj+E2o85j7kXZwGsx3FRqs
         MSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130876; x=1747735676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxTCWdoxxph2uKRlpdzs8tMyten2c/Vtkg5n7lhhiZs=;
        b=gTW8YBEw0TnEa3GaRdk11ztoOzWMhg/skIU2Y2/Z3dyWharm/BZ8ar887bMEv+FzMu
         VJXvUzIFgsjnvvFRyCyWLUI3J8K6DQ5TZSRrC6d1Hewg2VSk2fv3UnascHGW2KgBE4Ub
         CYxhU/j7aMQk6IYZmW7CLGQRfrTP9dhWK/gFtS7wrokUbw/Vjl3E8GidXr1IOCHbrhPn
         bF6cc7KHBAEzb9yBy8bkqTrdWs5omxhPzWEm9xjaZmBSU27smMuzemxSfDS9MlM+L5lF
         3Mr1bM2AD7EaQB8c2QUBHe9Ncpp1F5e0ln75yJ4dinrpvbQ9NQWpV/h9X+8nRWiMdyaa
         X8zA==
X-Forwarded-Encrypted: i=1; AJvYcCXxqTaVHvZE6mYdjTAwMh3YMVtYzVXxJwuvOckHh63kdAu3koHlq8vnuG0dUWJ4iUakXp7AJds52jHHxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1SN9NW8fsXg68SCeDoLfi49ECEuHKy7j8kbAhRAiGIfGGWtdP
	hMUl8yX9ZoQoxKlv8HtJdiZ3v1s5i1n/Mc137nL5JpSGvKViGtxH
X-Gm-Gg: ASbGncuusoAj79guBjJAnNiTSoYeuYeS10n8/Kk7L1po6IOXlMwFGZqe1M0sZfNLET3
	xyJrCzetWcgzymgZCrFAyw4QD4OwnYBPV+cuJd0YFMp5WMiaz/Eg0bpnp7saG/MvH1IuxFzaHju
	1X2ue3j+rHIyNl4TwwYXSyxK6SdQ4i1giZzZEYz99pTrbdmXQU3e5cqr/3CVl0gJzYKkBa5SIHK
	owcejkdeIJcHL617dR6t68EcLDAAYMz+mycxTiD+qFaF9m4m0zV2ys11wiIbJB/oQCafWBe4ge7
	PfSfz5sA2hmlqyEdBC2GmYn+xKc=
X-Google-Smtp-Source: AGHT+IH2nYMxmNh6Mi7SbRh4cdJMyyTGclEOl+xdQXn3Xj59qNVfbigfG60vlKhSQo/mjolVBqJhqQ==
X-Received: by 2002:a05:622a:406:b0:476:a969:90c5 with SMTP id d75a77b69052e-49452761774mr194593351cf.24.1747130875543;
        Tue, 13 May 2025 03:07:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4945259f42esm63437641cf.78.2025.05.13.03.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:07:55 -0700 (PDT)
Date: Tue, 13 May 2025 18:07:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
Message-ID: <ya3mpue6pndlzkmr6bouyrqldysmsfcu36b6lwrgbnvo2xw5ru@7ugamdke32nh>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
 <nrtzltuus47rjds3x54e72mtflvjh4najyqdjnagxq5etge5e7@vkikyxa5zf6k>
 <MA0P287MB2262F586320C31A7F887B5CEFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB2262F586320C31A7F887B5CEFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_110759_476982_08001308 
X-CRM114-Status: GOOD (  13.17  )
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

On Tue, May 13, 2025 at 05:59:23PM +0800, Chen Wang wrote:
> 
> On 2025/5/13 17:49, Inochi Amaoto wrote:
> > On Tue, May 13, 2025 at 02:48:44PM +0800, Han Gao wrote:
> > > I hope it is sg2042-x8evb.
> > > 
> > > Sophgo is also making EVB boards for sg2044.
> > > 
> > > I think a distinction needs to be made here.
> > > 
> > SG2044 evb has a formal name like srd3-10, but I think it should
> > have a sg2044 prefix. as the name printing on the board has a
> > sg2042 prefix.
> sg2042 prefix? :)

You are right, I have make a mistake.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
