Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD2BEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 08:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQkvWIZhsFxgDPgLrJSwmucxvWiY0a+AO3dTTsI8bA0=; b=FqQz9CV3h/WW2R
	D8rIosld5+W37E0huhdkvBa14JICfyhvEc4mRT+J4AHEo3rI7LB43KHCrowaQ6G5IO2pFPTpTpC6e
	ZKcQE11rfQ4Hf9hvWf45tlQMm4W0z+F/Is174wiMNZtAgkwGFTrnPlSklImleO1knMWAK8CBk5yiN
	Pwd/Qw2Vz9xuWqOa4i9ibffWicYzAMxxIuACElnRXMmSzjGCOykWf0RPH2JG8M3ixhYk5aPY5Sal4
	toat1blJvGSd+gP24giJ6IxBHk50EVnJKTgVcbWbDVQ/dagAZEjDCsPWwDCJl3SmilnqC29NvojbU
	Sty1X5Tfnot7+HjRzDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyqJ-005a07-1d;
	Sat, 24 Jun 2023 08:42:03 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyqG-005Zz1-2u
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 08:42:02 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b698371937so584751fa.3
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jun 2023 01:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687596117; x=1690188117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+IoVHOOaxOvnGfszpGBBVoMqyQkftnmEkEOdmANutg=;
        b=Sbbw0rxE8xQ5ESUyQyToNutKh+w5pCWFJ/a7u58ccU9y2hAw4vfQm1ZXJSnP0/nxKD
         HTEXKCe4JlJSeZVwB76uWXet+t78XFiZ5JGSUgIyWxOyIm+WxvbFXcrm10CEgFESlVTP
         BehGhMrPiUai7c7RdYen+B6EZBBI74SAYdJIRATdKtvZJKeavwR3soiEi9Y5RrwOJcOt
         DffoJfDRU8oJxkp960rIX668AAeysjB1FsBrYsCK6N2ja/lKExwlGD+kUuimSIEa7FR8
         V4GRx8lLr6//ShxB8hYQ9mX4RbNJL0ergYoVKQrmlKpdHyORiVfvUmdIJEDu2ucT1GFu
         p9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687596117; x=1690188117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+IoVHOOaxOvnGfszpGBBVoMqyQkftnmEkEOdmANutg=;
        b=E6t/StCUcccMiIGvFeRPBO1P/IlZBp6nVFNA2Rjt0RDYgtB63hhFFGB1Gn2YiRICg4
         hf3LzbLNtVdns1vATRda/KEfagz+B0sQ6ojbFGwfgC9DZ9jIVXE9tC9Z8cnRaHRbpLIN
         V1fLfQg3hSms7nPK7hX84pdTSEsjb7AuGk/tswqPWUb+QjdKLwoJ730tC/59n9e7Z5W8
         MafFL0W5rxlnygbSD/CeFPZZOO8XzDlYVnNSV5oJiiB1zvuka7K3qGquokMZMnEQFhG/
         WQL4JBXoDjtylCoQYS94zfAaTM1FPN0bdXkDug6Fh4jPBJp8aKK3PQGd7jhQNgxvVyUE
         d2/w==
X-Gm-Message-State: AC+VfDzIt/LDv/SE4iW4YYMlQUrHIIEwmfKFZDe6hiRfN4MXaoRESjUf
	MVPqUsjY52gxQYrcT8XBc8T6rS4ei7TUs2Yz2wAV5Oi1VNVecFio
X-Google-Smtp-Source: ACHHUZ5/0aY+Nwi4gnVmYerMAgJMX+CJWvkvU67mdHjFZjvq8FBknVGq/iYpJHS9iePgsL45b5E5L/hPP7VEmI6mhqU=
X-Received: by 2002:ac2:5bca:0:b0:4f8:67e7:8a1c with SMTP id
 u10-20020ac25bca000000b004f867e78a1cmr5280855lfn.45.1687596117436; Sat, 24
 Jun 2023 01:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <871qi4334n.fsf@all.your.base.are.belong.to.us>
 <20230622154738.6403-1-andy.chiu@sifive.com> <87edm3jvub.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87edm3jvub.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 24 Jun 2023 16:41:45 +0800
Message-ID: <CABgGipVRf6ahuSvZvgpew91o_xjviiMKAp0nNF0S7XwLgXgREQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_014201_049964_8746BD2A 
X-CRM114-Status: UNSURE (   8.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgMTI6MzjigK9BTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPiBUaGlzIGZsb3cgZG9lcyBhdm9pZCBzb21lIGNvbnRleHQgc3dp
dGNoIGNvc3RzLCBidXQgSSB3b25kZXIgaWYgdGhpcyBpcwo+IHNvbWUgdGhhdCBjYW4gYmUgYWRk
ZWQgbGF0ZXIsIHdoZW4gd2UgY2FuIG1vcmUgcmVsaWFibGUgbWVhc3VyZSB0aGUKPiBvdmVyaGVh
ZC4gUHJlbWF0dXJlIG9wdGltaXphdGlvbiwgYW5kIGFsbCB0aGF0LiA7LSkKPgoKU3VyZSwgZG8g
eW91IHN1Z2dlc3QgYW55IGtpbmRzIG9mIG1lYXN1cmVtZW50LCBleHBlcmltZW50LCBvcgpiZW5j
aG1hcmtpbmcgdGhhdCBjb3VsZCBnaXZlIG91dCBhIGZpZ3VyZSBvbiBob3cgdGhpbmdzIGFyZSBk
aWZmZXJlbnQ/Cgo+Cj4gQmrDtnJuCgpUaGFua3MsCkFuZHkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
