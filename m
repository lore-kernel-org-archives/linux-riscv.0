Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC4DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 03:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kV2OKAnyC8rq81ZsB4wVi0u/LAOJ8RZ1RH6/zU/wPnA=; b=pM2V3QFLJdSzSK
	eeH28JQwj2G1L5f/upedzDN09d4hFeXAscjf6tFFKYsr5NUuRws7irK8JRMeYaC/S3HF4THuplBc8
	ncHUg7pl9T7jlVOD4E2zKUq8ccsqR4sK4P4q83LcNbDLIZOLXsoV2oD+ki9ogKrayTBmn96JoQVTS
	XFHN0+ENmR7w30aCm4duefSDS+rcudjPDAZtvw1HuN8Uw3SUqzEHykwDMHj1o6jf9hzMGLT2UPKgY
	FxRXh5aOGhAvaGc5rZDwMxHP8OBeKHpM5i0iA776CG4q654sqNj1zH43VQ9xiWGXUgsgPwSY+mykc
	k8P8+wPW9wyDW0BRrFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrXc2-00HELH-Tx; Mon, 29 Nov 2021 03:45:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrXaD-00HDFo-Sa
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 03:44:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id s13so33662118wrb.3
 for <linux-riscv@lists.infradead.org>; Sun, 28 Nov 2021 19:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+QDxtMYsiGpTbjQ64wPI5k5f7+JtFNl3ARwWkRt14a8=;
 b=ZU1Eln/9SfoVq+B1U5sfkGF2CKQj0m12USLmliZF8vtG281sSfnKd1llBqsKNcuqc2
 8N5fgyQytGWDCJcq36yzg17WxrxXioox9VRTAfRnldAXTNEp37nVe8IechsY1OXtWqmT
 +1peJdK+SSGcJwBQrdIZu4l/IIJXoUr4NSG4jK2hWbBB2oroBW5p+6DMWALBuFNs00oE
 yMtPXtXwPlRH38pIp3gZBltyLvbPamz2XjmQtJ+J3Z4+XxIBEXmozVRZ/SePp8ecprth
 WM9my2Gykuzd4pOFMsuZiVkqv1Jzi9fnhLbPO7pmX7iwo4SGyvjXsJ6stCH3cM13JSPE
 Q0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+QDxtMYsiGpTbjQ64wPI5k5f7+JtFNl3ARwWkRt14a8=;
 b=gA/SCl0ISiFprrkatiE7oYPGDnZavatkfjjN9S8/lJ9lYgq/jj02r9+kk4NBJTFXge
 c54rZoEQun6OriA+MYtdMfb7x+TPEvyuzg+IAusZirSLHQqWGM+p4nX4ZBp9UAm3OPKJ
 Stzx+2/K6DHl866FAUMdes96Sf3n0hM6t+OptdRbahxm/ofFuo6/w2vOuC9rNHjTLTW9
 MxMys+HtnqszOKa7YkaeUzLqa8ocbPKlMjWhbYO1yw1FJkNpTNwy5SAaJNA/J802F/NT
 Xi4PEQNkL4IJD9ug2OhdCTrqIPwv7qn3MlF3m2Px4ozHCnYFaKvQVpW5T+OODra4a2d1
 jHug==
X-Gm-Message-State: AOAM531IqTM/fdqIpmOBmcACJ7vye7oc9G6zkEp9HVrnG/4NrlRVMhv3
 HY/vJDBKoYjFL9hIQ8B4uwZdaPmff9wo5K0mvq9mbg==
X-Google-Smtp-Source: ABdhPJxVfNspMPegX0nnAqIOrb8ixJr5KGAdRv5R05/KZLzp7MAcQcov9DD8ovNlUXIEHNvkgRgpGDqR8pC579umDK8=
X-Received: by 2002:adf:e848:: with SMTP id d8mr31758948wrn.3.1638157440427;
 Sun, 28 Nov 2021 19:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20211126154020.342924-1-anup.patel@wdc.com>
 <20211126154020.342924-4-anup.patel@wdc.com>
 <9545cab7-6365-b20d-fc05-82ace6368661@redhat.com>
In-Reply-To: <9545cab7-6365-b20d-fc05-82ace6368661@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Nov 2021 09:13:49 +0530
Message-ID: <CAAhSdy0v=CrxJwiMtkPaR9y2WHcwqZZC9-mgc0ZncJ--69rVag@mail.gmail.com>
Subject: Re: [PATCH 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup.patel@wdc.com>, Shuah Khan <shuah@kernel.org>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_194401_982688_E5E8835E 
X-CRM114-Status: UNSURE (   8.45  )
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

On Fri, Nov 26, 2021 at 9:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/26/21 16:40, Anup Patel wrote:
> > We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile
> > which will allow users to pass additional compile-time flags such
> > as "-static".
>
> Is this just for debugging?  I cannot understand if it's used in patch 4.

Yes, this is just for debugging.

I am using it to add selftests ELFs to any arbitrary initrd so that I can
try selftests on Spike, FPGA, or even HW simulators.

Regards,
Anup

>
> Paolo
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
