Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E06C531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 12:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7p6aO0ZQ9VbXiqVM2xl7HcnN5sZJHxbIHZvKtMIyiE=; b=VI9Ofh0uPfdVSd
	uxSojKjFCrxamtojPKjWsY2L281HyNFjZzahFXDd0ILwpX2dhoU4WEX+/2p8ZMDj9UJlz5ewlBj62
	CFB/Eg2hMJ06FcPKGGzT8EtI49SfzQPMujpSMdFTvwFIvs0lhqcwNMBpW40T+1Nz4S3x6CFkDKc/U
	s043fxpkPlc1jUiSH23YJkf13xkwKJAdgEmFxe8FtXOLtokZ5t3ploDeeXL0sec6g5EakSXNrSk+8
	g3Z0WdKrcWfjBi1eD6aekXnSPKJDgXR4lqlWGNqDHzdpxxrsmyycuN15oAhhfUNsOKJgJvXc0CpYJ
	PtJrkcA0LF9ypVK53chA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFPt-0000000GQpj-16XG;
	Fri, 24 Jul 2026 12:54:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFPs-0000000GQpd-1Wsk
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Jul 2026 12:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=igcirK555i4HrlIuKFrv8pMFmfvzTpNlfQp9aKvV0r0=; b=hc2p8XDmrBjMA8iopb27rtWbGx
	SnMjXosajJ+nXhVh1TwBcOAW7AEcVkFNYWQ17W3sZR7mnKp2VGt9TNd/GsBduhGOeRsoNKVnaxN7e
	G5ecypbdQcOtDyOOugOUk7llxyqM6K9GwZ3PPG87UF0fKVuAE9H06o4IIUCuQPc2RVDW633aCsFQX
	OJUSGl8XMcz3qv5NJu8RvhvBbZERb9UVpKu7DkOG+3/YBkwisWwgwYhL9/7F3kyCoHB/uoGWeyuU7
	/DzvWs+2vQ9XOdCPHYqkNJ5Jo8Ehfchy1GGF3D//ms364GZqmGJ28NzHIALGdUcqRlZds9MaNKRaz
	NK4gSF+g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnFPp-00000002Yb0-1VeR
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 12:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784897643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igcirK555i4HrlIuKFrv8pMFmfvzTpNlfQp9aKvV0r0=;
	b=Fbkbjp1bt/z0LgZ+/UY3MllEYZkuDfdXnBILU1f5MaHEeaFiuIm/WlwOSm94E830+Z5DFv
	LiZ3ZxkV1pdUNit5epRoLTwnhQO/Bv6aIUaTfML8tcAOPoiLHo19OHWqRyueQjwLNbyBEi
	xI4Yx0niybuVHnEWaKcdIl5bEECdeYk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784897651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igcirK555i4HrlIuKFrv8pMFmfvzTpNlfQp9aKvV0r0=;
	b=gvlrdRpFptx+OCbex0gAMbyfSVjnAPVBMDrQFDYVekXTRzCANibeIgEbhNZmJrqF6nmgzO
	2E10rMa5nufk490n2rQD0Ro806IKSzcyvTMqrhmTjoDSh+Pf/EfkMuvf95h9q32XIC69l4
	AwXKJFAufzq7gz8baQWAhLOTMamAfAA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-eQ3RHwcuOEKExWdCda6N-w-1; Fri,
 24 Jul 2026 08:53:56 -0400
X-MC-Unique: eQ3RHwcuOEKExWdCda6N-w-1
X-Mimecast-MFC-AGG-ID: eQ3RHwcuOEKExWdCda6N-w_1784897634
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 58B6E1833481;
	Fri, 24 Jul 2026 12:53:52 +0000 (UTC)
Received: from oldenburg3.str.redhat.com (unknown [10.44.33.62])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7E661956063;
	Fri, 24 Jul 2026 12:53:41 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Paul Walmsley <pjw@kernel.org>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Alexandre Ghiti <alex@ghiti.fr>,  linux-doc@vger.kernel.org,
  linux-riscv@lists.infradead.org,  bergner@tenstorrent.com,
  kito.cheng@sifive.com,  dfustini@oss.tenstorrent.com,
  greentime.hu@sifive.com,  Andrew Jones <andrew.jones@oss.qualcomm.com>,
  Nutty Liu <nutty.liu@hotmail.com>,  Pincheng Wang
 <pincheng.plct@isrc.iscas.ac.cn>,  Yao Zihong
 <zihong.plct@isrc.iscas.ac.cn>,  Xu Lu <luxu.kernel@bytedance.com>,
  Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,  Jingwei Wang
 <wangjingwei@iscas.ac.cn>,  Zong Li <zong.li@sifive.com>,  Deepak Gupta
 <debug@rivosinc.com>,  =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>,
 linux-api@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: hwprobe: export the availability of vector
 to user
In-Reply-To: <20260723222109.2229089-2-tchiu@tenstorrent.com> (Andy Chiu's
	message of "Thu, 23 Jul 2026 17:20:56 -0500")
References: <20260723222109.2229089-1-tchiu@tenstorrent.com>
	<20260723222109.2229089-2-tchiu@tenstorrent.com>
Date: Fri, 24 Jul 2026 14:53:38 +0200
Message-ID: <87bjbwk0q5.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: K7AzgyyVL_Gucn4Gb17G9_qRgviZVAfhiLPCgLgZqww_1784897634
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_135413_646175_26F28783 
X-CRM114-Status: GOOD (  15.53  )
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

* Andy Chiu:

> Userland IFUNC resolvers use hwprobe to decide whether to dispatch to
> vectorized routines. But RISCV_HWPROBE_KEY_IMA_EXT_0 only reports what
> is present in hardware, not what the calling process may actually use:
> when Vector is disabled for a process via
> prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), it is still
> reported as present. A resolver that trusts this and runs a vector
> instruction crashes with SIGILL.
>
> Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
> no value of its own. Within a single request, keys placed after it report
> extensions that are both present and enabled for the calling process,
> while keys before it keep reporting hardware presence. This masks out V
> and its V-dependent sub-extensions when V is disabled for the process, and
> lets userland obtain both views in one query:
>
>       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
>           present       modifier       enabled
>
> The enabled view depends on per-process state, so it cannot be served from
> the vDSO's process-independent cache; requests carrying the modifier are
> deferred to the syscall. Unknown keys are still reported as -1, so the
> feature is detectable and existing users are unaffected.

What is the expected behavior if RISCV_HWPROBE_KEY_EXT_ENABLED is not
supported?

We only get a true userspace simplification over hwprobe + prctl if we
can disable vector extension usage if the kernel does not support
RISCV_HWPROBE_KEY_EXT_ENABLED (so a V usage regression for older
kernels).  Otherwise we'd have to use the new approach and, as a
fallback, the old combination of hwprobe and prctl.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
