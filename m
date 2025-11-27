Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7C5D1170E
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:
	To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVHMgX+6wnKOXUxnLVKnDfocKWnY5SeVioVzfmfCRko=; b=nKRRnIhsVqylGcPx361Z2hCGUg
	22199osTSe9upRVy7hqGPDfOS2cGBnnUl4Z9R2n5XPNcDbOVl329GaD51rKTDW6e7xVT3jq1y4VHE
	MqEhRoCbcOndOqLf2qnn1VC2unG4IbrjK5WZnHpF5nDrrPF/JjYxeUYyqw3ITb0wl9vTeD8+cLEEU
	V0LfPXoxpkWvyBj0hYbc8zs/rgiek+LB2fQk16Ac/TWvAsd2sbo+tgLEzQz8ZGjygPLRW4Pu//B67
	qQoiLlOZm9PwFqUHXEFRUMBVuvZASS0dpIVLHJw5ziD/JsPioa8a0HZeHTUpHjXNSnLY1wJFCGzjM
	XOo7y2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTNG-00000005cy4-0J8o;
	Tue, 02 Dec 2025 16:37:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQz2-0000000FrLP-3xUa
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 01:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06A1860206
	for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 01:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35F3C2BC9E
	for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 01:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764207583;
	bh=33DAmtz0T1Wk45ojEkNiv9Smp3gbLxO5hMsJobibC6M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ASrosAfXzXDYTtfmiubJ8QSZc/55meR2oT6caFpaZTf1R/c86RYXcS5FWZw+xcaEv
	 /AmBn4EROS6vgtQJE7BP86P7P6P4G7R3ZgCR7Xl6Qihl6kK1xk4Bgi3/xkzlKB7sT9
	 d6NY/SBENyz59Nhr7+4nGMbQbinZJEU39Jfm8UkIxB53VJVD8bqNWHWz3bEEjghhk9
	 bO5rSVfT1vyWrodRVfL1kQ/JcLfukk3YDDXb9QbfrPCl0+Y6ficsa9MRQRABsMgZ5O
	 afb8fzGfcgAeeEvv7IqBdYJ/JU/L+SAZ0gYdjlw86q+2h3GHloswOytKOgeyF5FBwX
	 XsmSKo+u5OaKg==
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so224172f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 17:39:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVc3/7mtdqLpISx3ep5kC4JnmtkvJS5kelWlBHIo5ZKK21c1TgNqSA+POAbiC5tbXZUWjIC5ml0oGMOxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBppoME+ayyeiBCvl0TqReySbNEu4oQWU4sVBsKZEdZZz57reU
	ky73BfUmgFBwCAVBzVed2Mnr6kVcq0x7ScEPajz+esTgAcI0+o8Eh7gutD94eY6DwGp6QuETr4o
	oYDPUmHZ/MYQRhDyfciyq1tSV4gSfNkk=
X-Google-Smtp-Source: AGHT+IH7UqWcF/M2zgLggnwFP5O/sHxQY69zIVQrr9GOO6eyvPiAkeIzvTeHcbolbI3cHRukcJlVpnDbng34nuOPvsM=
X-Received: by 2002:a05:6000:2288:b0:42b:39ee:286f with SMTP id
 ffacd0b85a97d-42e0f356894mr9226362f8f.48.1764207582070; Wed, 26 Nov 2025
 17:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20251124-4ecf1b6b91b8f0688b762698@orel> <20251125141811.39964-1-fangyu.yu@linux.alibaba.com>
 <DEHZBIAB842A.1AUCJS0OR923@ventanamicro.com>
In-Reply-To: <DEHZBIAB842A.1AUCJS0OR923@ventanamicro.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 27 Nov 2025 09:39:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTYwsG4Q6n3JWi8S4brOA_mh7OdpquMU-eJYAEHwDeSdw@mail.gmail.com>
X-Gm-Features: AWmQ_bmk3jZE6NDoyOoINIu4O_mcmRjpcnb2qtbtnNKpj2S1miLcX_d5rIjtVA0
Message-ID: <CAJF2gTTYwsG4Q6n3JWi8S4brOA_mh7OdpquMU-eJYAEHwDeSdw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Allow to downgrade HGATP mode via SATP mode
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: fangyu.yu@linux.alibaba.com, ajones@ventanamicro.com, alex@ghiti.fr, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, pjw@kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-Mailman-Approved-At: Tue, 02 Dec 2025 08:37:08 -0800
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
Content-Type: multipart/mixed; boundary="===============7659067478838633670=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7659067478838633670==
Content-Type: multipart/alternative; boundary="0000000000003d4d790644899634"

--0000000000003d4d790644899634
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 2:16=E2=80=AFAM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com>
wrote:

> 2025-11-25T22:18:11+08:00, <fangyu.yu@linux.alibaba.com>:
> >>> On Sat, Nov 22, 2025 at 3:50=E2=80=AFPM <fangyu.yu@linux.alibaba.com>=
 wrote:
> >>> >
> >>> > From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >>> >
> >>> > Currently, HGATP mode uses the maximum value detected by the hardwa=
re
> >>> > but often such a wide GPA is unnecessary, just as a host sometimes
> >>> > doesn't need sv57.
> >>> > It's likely that no additional parameters (like no5lvl and no4lvl)
> are
> >>> > needed, aligning HGATP mode to SATP mode should meet the requiremen=
ts
> >>> > of most scenarios.
> >>> Yes, no5/4lvl is not clear about satp or hgatp. So, covering HGPATP i=
s
> >>> reasonable.
> >>
> >>The documentation should be improved, but I don't think we want to stat=
e
> >>that these parameters apply to both s- and g-stage. If we need paramete=
rs
> >>to dictate KVM behavior (g-stage management), then we should add KVM
> >>module parameters.
> >
> > Right, adding new parameters for g-stage management is clear.
> >
> > Or we could discuss this topic, from a virtual machine perspective,
> > it may not be necessary to provide all hardware configuration
> > combinations. For example, when SATP is configured as sv48,
> > configuring HGATP as sv57*4 is not very meaningful, Because the
> > VM cannot actually use more than 48 bits of GPA range.
>
> The choice of hgatp mode depends on how users configure guest's memory
> map, regardless of what satp or vsatp modes are.
> (All RV64 SvXY modes map XY bit VA to 56 bit PA.)
>
> If the machine model maps memory with set bit 55, then KVM needs to
> configure Sv57x4, and if nothing is mapped above 2 TiB, then KVM is
> completely fine with Sv39x4.
>
> A module parameter works, but I think it would be nicer to set the hgatp
> mode per-VM, because most VMs could use the efficient Sv39x4, while it's
> not a good idea to pick it as the default.
> I think KVM has enough information to do it automatically (and without
> too much complexity) by starting with Sv39x4, and expanding as needed.
>
Good point; if only a 128GB GPA memory region is needed, there is no need
for Sv57x4, which costs PTW cycles.

So, the detection should start from Sv39x4 to Sv57x4 with the guest memory
size.

--=20
Best Regards
 Guo Ren

--0000000000003d4d790644899634
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 26,=
 2025 at 2:16=E2=80=AFAM Radim Kr=C4=8Dm=C3=A1=C5=99 &lt;<a href=3D"mailto:=
rkrcmar@ventanamicro.com">rkrcmar@ventanamicro.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">2025-11-25T22:18:11+08:00=
, &lt;<a href=3D"mailto:fangyu.yu@linux.alibaba.com" target=3D"_blank">fang=
yu.yu@linux.alibaba.com</a>&gt;:<br>
&gt;&gt;&gt; On Sat, Nov 22, 2025 at 3:50=E2=80=AFPM &lt;<a href=3D"mailto:=
fangyu.yu@linux.alibaba.com" target=3D"_blank">fangyu.yu@linux.alibaba.com<=
/a>&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; From: Fangyu Yu &lt;<a href=3D"mailto:fangyu.yu@linux.ali=
baba.com" target=3D"_blank">fangyu.yu@linux.alibaba.com</a>&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Currently, HGATP mode uses the maximum value detected by =
the hardware<br>
&gt;&gt;&gt; &gt; but often such a wide GPA is unnecessary, just as a host =
sometimes<br>
&gt;&gt;&gt; &gt; doesn&#39;t need sv57.<br>
&gt;&gt;&gt; &gt; It&#39;s likely that no additional parameters (like no5lv=
l and no4lvl) are<br>
&gt;&gt;&gt; &gt; needed, aligning HGATP mode to SATP mode should meet the =
requirements<br>
&gt;&gt;&gt; &gt; of most scenarios.<br>
&gt;&gt;&gt; Yes, no5/4lvl is not clear about satp or hgatp. So, covering H=
GPATP is<br>
&gt;&gt;&gt; reasonable.<br>
&gt;&gt;<br>
&gt;&gt;The documentation should be improved, but I don&#39;t think we want=
 to state<br>
&gt;&gt;that these parameters apply to both s- and g-stage. If we need para=
meters<br>
&gt;&gt;to dictate KVM behavior (g-stage management), then we should add KV=
M<br>
&gt;&gt;module parameters.<br>
&gt;<br>
&gt; Right, adding new parameters for g-stage management is clear.<br>
&gt;<br>
&gt; Or we could discuss this topic, from a virtual machine perspective,<br=
>
&gt; it may not be necessary to provide all hardware configuration<br>
&gt; combinations. For example, when SATP is configured as sv48,<br>
&gt; configuring HGATP as sv57*4 is not very meaningful, Because the<br>
&gt; VM cannot actually use more than 48 bits of GPA range.<br>
<br>
The choice of hgatp mode depends on how users configure guest&#39;s memory<=
br>
map, regardless of what satp or vsatp modes are.<br>
(All RV64 SvXY modes map XY bit VA to 56 bit PA.)<br>
<br>
If the machine model maps memory with set bit 55, then KVM needs to<br>
configure Sv57x4, and if nothing is mapped above 2 TiB, then KVM is<br>
completely fine with Sv39x4.<br>
<br>
A module parameter works, but I think it would be nicer to set the hgatp<br=
>
mode per-VM, because most VMs could use the efficient Sv39x4, while it&#39;=
s<br>
not a good idea to pick it as the default.<br>
I think KVM has enough information to do it automatically (and without<br>
too much complexity) by starting with Sv39x4, and expanding as needed.<br><=
/blockquote><div>Good point; if only a 128GB GPA memory region is needed, t=
here is no need for Sv57x4, which costs PTW cycles.<br><br>So, the detectio=
n should start from Sv39x4 to Sv57x4 with=C2=A0the guest memory size.</div>=
</div><div><br></div><span class=3D"gmail_signature_prefix">-- </span><br><=
div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best Regards<br>=
=C2=A0Guo Ren<br></div></div></div>

--0000000000003d4d790644899634--


--===============7659067478838633670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7659067478838633670==--

