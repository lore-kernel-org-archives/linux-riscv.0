Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F6CECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7cV5XlealQJGmnnuoqY4lB8B/va3jhhl5UVq0ga8/s=; b=5E+AHa0shKjC11
	5dRI47iVRaCRQ+D5bU46sG6HzAERP/ogYcLHCh/OxKRhACV7sKDUre4wDObsnhj+/bDib2ZuiB/R8
	sjsV0EzVjKpphnRr0DlokqGfy+GYvk6wuBLI9Cdb6Y8F1xYJljR4dKbgDhQaGNUawp302hA/Rjdjy
	0aID9sGHsT5pXq3Tm3wSEJ01msJyp9c+I1g3B6QB9jl19UhVz0O19YzrZPdiYVaU6Lip6cb9RIllh
	ZVmB4HFSbDbU7MTkEVuat2oB9FaRwAVA0KdBdknwc4IdwX/KYS8QM5ypLIZtOxAp4XC8ESk2iW86e
	HfZKFs5SGTO0d9aejsAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaki-00ExIa-S4; Tue, 06 Sep 2022 15:44:40 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZuy-00ESeN-2R
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 14:51:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id s11so15471914edd.13
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=d8nQp3l/u7eqzmULZhtUdinLH8+7UKH4sRE02pcb6qg=;
        b=m62Hf+tI24xsZc5e+4M87Oq2hDkPmUnQbeIf22NbQYDSrUTXuVZosqm767EwTDG9Sp
         DTcBmMV8He4lOAc15gLXqWgkPVTkih58LwTpgtpvaSV5+3Pny7CLjwG2PQ7DX2ShPdXw
         rxtqXOB2TaK8wKFn+hnhicEkZ5M1oY2ct0cO+wDI4ZDX1I0z4YNQN0uFUvPzUPST/L+v
         h50tr/5DuEhd3vOzePM3uO9pxoOiX9oeSzBC51bbi17FHfBGhsAzSt+7BC4p1Fs3BWna
         bmyDc2oloH9VNwYJmaAkH7U4IxyjchTEg+qCNXyK2ZcrqYFRVb3ajVFRKRFDLzBuFHvv
         5b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=d8nQp3l/u7eqzmULZhtUdinLH8+7UKH4sRE02pcb6qg=;
        b=J0m3DefzBGzYXW1wWgEjrIICz2yHWKsbdT7GOoIJ2ksLCBIlrvBHbmNAapUo2ym39A
         TWsX/f8qKXDDQJBYvKLnJkPDRnx5O2IE+SI8Btep8z1Os/VBCGNEi+okxbBk2vsKU+pQ
         lbG+TAuKIuB/pItMnWZct3cTfqMOBiDFgL4N5d4I6UAOKv/QNrDlSpwlqrFYKF3H96U7
         O/Jc3tiA/b1rSegW7LTGK8f3Jfs2FTrMdOOJzKVNH8VyGT6MgJBfQkpuukPipRqdpZGr
         A6b16b0BR974sYF6MUlAKnxHUv67ExB11/w3RUC6SsXlWuouCnghV/sAxLYRYgcALAlA
         c5Hg==
X-Gm-Message-State: ACgBeo34CUUwkGEldPXMnBv06JKa2/kC1otN0Amlcy2XH63/Z5DOmz/0
	24AhSfTXnfwHVJ35sHfOJxPeVw==
X-Google-Smtp-Source: AA6agR7HB7z6gbdz+XIfjfulcXBnROv1CHId+xJxQsB4nrtB8XoOaYJKwJf8bwcchkj6JJHiHpHZGw==
X-Received: by 2002:a05:6402:5110:b0:440:4cb1:c137 with SMTP id m16-20020a056402511000b004404cb1c137mr49820479edd.262.1662475869638;
        Tue, 06 Sep 2022 07:51:09 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id f25-20020a50fc99000000b0044ea1fe7ce4sm3180324edq.56.2022.09.06.07.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 07:51:09 -0700 (PDT)
Date: Tue, 6 Sep 2022 16:51:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Conor.Dooley@microchip.com, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH 1/3] RISC-V: Output cbom-block-size
Message-ID: <20220906145108.7ok5kh5y2hddoide@kamzik>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
 <20220906092934.mn45eil73xh2lgel@kamzik>
 <9f46a2dc-7515-c460-002a-29d8e32562df@microchip.com>
 <2994956.KTMopqUuYO@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2994956.KTMopqUuYO@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_075112_211278_0963357E 
X-CRM114-Status: GOOD (  43.54  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 06, 2022 at 04:34:49PM +0200, Heiko St=FCbner wrote:
> Am Dienstag, 6. September 2022, 11:42:11 CEST schrieb Conor.Dooley@microc=
hip.com:
> > On 06/09/2022 10:29, Andrew Jones wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you kno=
w the content is safe
> > > =

> > > On Tue, Sep 06, 2022 at 09:00:20AM +0000, Conor.Dooley@microchip.com =
wrote:
> > >> On 06/09/2022 09:55, Andrew Jones wrote:
> > >>> EXTERNAL EMAIL: Do not click links or open attachments unless you k=
now the content is safe
> > >>>
> > >>> On Tue, Sep 06, 2022 at 08:40:23AM +0000, Conor.Dooley@microchip.co=
m wrote:
> > >>>> On 06/09/2022 09:35, Andrew Jones wrote:
> > >>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you=
 know the content is safe
> > >>>>>
> > >>>>> Provide an info message with the block size when the Zicbom exten=
sion is
> > >>>>> present and the block size has been determined.
> > >>>>
> > >>>> Why might someone care about this?
> > >>>
> > >>> I was unaware of anywhere else besides hardware descriptions where =
this is
> > >>> published. And, while dmesg isn't really publishing it in a way tha=
t is
> > >>> useful to anything other than human readers either, it at least mak=
es it
> > >>> easy for a user to check it for sanity purposes (which is what I us=
ed it
> > >>> for) or even for applying it if they want to write something that n=
eeds it
> > >>> and the OS provides U-mode access to CMO.
> > >>>
> > >>> I'm not married to the idea, though, so if people would rather have=
 less
> > >>> logs than this information, then I'm fine with dropping the patch.
> > >>
> > >> I don't really care either way about logging it, if it helps people =
to
> > >> be able to see it perhaps there's a better location than dmesg -
> > >> would {debug,sys}fs be overkill?
> > > =

> > > Thinking about this some more, I think sysfs would probably be the be=
tter
> > > way to go from the start. This patch should probably be dropped and I
> > > can try to add a sysfs node. The hard part of that will be the naming=
...
> > > How about
> > > =

> > >   /sys/devices/system/cpu/cpu*/cache/cmo_block_size
> > =

> > Seems sane to me, but I am oh-so-very-far from an expert here.
> > Heiko might have a more qualified opinion.
> =

> I guess I'd more start with a pr_debug(). When debugging you
> get the output and regular users won't care at all anyway.
> Otherwise you can also just
> 	cat /proc/device-tree/cpus/cpu\@0/riscv\,cbom-block-size | xxd -p
> =

> =

> Sysfs is whole different can of worms, as you create a new userspace
> facing interface, which you need to support indefinitly.
> =

> =

> Similar to Conor, I guess it would be interesting to me, what problem
> you're trying to solve, as in my (simple) thinking, everybody that somehow
> needs to check the block-size should have the knowledge to get it from
> any of the dt representations we already have ;-) =


Easy to get from DT, not so easy to get from ACPI.

Anyway, I'm fine with dropping this patch (I'll send a v2 without it to
make that clear). If we do ever want to enable CMO in U-mode, then this
will likely come up again, but then it'll have better justification to put
the size somewhere that applications can easily get it (and I believe that
will be sysfs).

Thanks,
drew


> =

> =

> Heiko
> =

> =

> =

> > >> I was just more interested in the motivation behind the change itsel=
f.
> > >> Maybe some of the above in the commit message wuld be nice?
> > >>
> > >>>
> > >>> Thanks,
> > >>> drew
> > >>>
> > >>>>
> > >>>>>
> > >>>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > >>>>> ---
> > >>>>>     arch/riscv/mm/cacheflush.c | 4 +++-
> > >>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
> > >>>>>
> > >>>>> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflus=
h.c
> > >>>>> index e5b087be1577..8595baf8e403 100644
> > >>>>> --- a/arch/riscv/mm/cacheflush.c
> > >>>>> +++ b/arch/riscv/mm/cacheflush.c
> > >>>>> @@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
> > >>>>>                    }
> > >>>>>            }
> > >>>>>
> > >>>>> -       if (probed_block_size)
> > >>>>> +       if (probed_block_size) {
> > >>>>>                    riscv_cbom_block_size =3D probed_block_size;
> > >>>>> +               pr_info("riscv: Zicbom: Cache blocksize is %u byt=
es", probed_block_size);
> > >>>>> +       }
> > >>>>>     }
> > >>>>>     #endif
> > >>>>> --
> > >>>>> 2.37.2
> > >>>>>
> > >>>>
> > >>
> > =

> > =

> =

> =

> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
