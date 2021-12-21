Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BEAC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20K6oR10KpD/seIzUTyHnPegCh/PoGZHXZb9V0rBMsw=; b=B4bL+MRZRQSBWt
	wo0H46xZpES6jz+kzO2veqKUkAL57kBaMiwrEi9HApKjrz4FSzMc+WBFYNt4Kedu76Tm5XnBXIMEK
	3oXgxrx3k3yLDNiWEEgenQz5qH2Cxd3f1q3yi/kJuzDdBYPx/89mVOECLcUFLM3HnuAg+OlzoBnxg
	MAlYRfa1jYasM9P0QcjifJ3kSvEcIkdH0d/dcGsY5QRDCyqYpBWVV0mGvQK3Z9KlbLRucxoihGMOO
	jfDX3aC4PdMZSOZhnUJoMO7ZicU29iuHbcdB0harGy+qHSEa3PO4eqUrQgkNP33D8WvEVRY79nm+f
	w01ZShVSQVUAGOTYh6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzbIt-0065ck-9p; Tue, 21 Dec 2021 09:19:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzbHj-00657j-Ps
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 09:18:18 +0000
Received: by mail-wr1-x432.google.com with SMTP id e5so25524294wrc.5
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 01:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N5iW+pC6M0AC4rvnvC3YKv4mJu1z1Np9Tq93xhecgLQ=;
 b=wmThj83tixQB1+BvJAJrVB/eEODHqng1WY9c+gR32gqWxx99qGwSpZhMDzo0lxPhgU
 OTrs/MCv6swvPynzZCl9lJYPdgdoMQYJNBLVtuq/95C8zzcfM1Y/lKidhvKSMQ99y0/+
 sFxJM+XSivzlFWd9GtFk4xjXYPawMWvSbhRXwE6XSDGdEczu+YaHWzusyX5HEhQMreWU
 HESQJlcSbNwvEXmXfLrASRp3HdBFMNn5j/nAVem98SaHx7ZjsVArg+7ubzjci9Gtz9Nf
 YlLIx4KwOMYkNuhM6FV6PkBI9VsItVQ9iDaEoEGsXlRCh0y7AT2JO77Rp/78S7n3d9Yx
 PLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5iW+pC6M0AC4rvnvC3YKv4mJu1z1Np9Tq93xhecgLQ=;
 b=X44L6sLnw9/Fb9LhNesoZEfFoLBjHdiNtsE01QeUwbPC48IkVFPU5XZN5VkzPXIrWj
 6QyfiZaLPMJahmG80ocEjg+NPY7UF4ibG6zMbIxvkaBBjT4nFCS4n+OkvAUi9+0xu/lc
 UitwJCpLhlxsdZYHWqMWs5jRUO9aCeKo3xvMgImLDHjthxyQPRkcU9XRPUjqVS/eXO5R
 BqxBCKvp/VjxKDvOWeJF9SE6wO3CyYT6agpV/JYdkAY6lpWjOIwCBDf7jrIV7fJoGr5d
 7aDk22jlpKEpr+tOrtKJed5jsnepbQ719PoTTQhH6N38mS5KxtbnqU/IPOE0ECPLi/aJ
 W8BA==
X-Gm-Message-State: AOAM533b0N5NECRMfjWIiuZGgM/pm44IBeCkgL5nsDeKqP+1qL9aD6tq
 n5uCyO8ubEk05lCLEZoHCp+C9cAhchhgD8WVE5lySg==
X-Google-Smtp-Source: ABdhPJzMvJnvVrz3bX+O2cAARxvuaHmFVbxXAqaY95aKoQpjTR9wr3hdKBSBb2JrUTXsC2EDT+BMLl+GmavOkoTedYw=
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr1843378wrw.313.1640078292945; 
 Tue, 21 Dec 2021 01:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20211129075451.418122-1-anup.patel@wdc.com>
 <20211129075451.418122-4-anup.patel@wdc.com>
 <YcDdPUn9bAVnxb/2@google.com>
In-Reply-To: <YcDdPUn9bAVnxb/2@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Dec 2021 14:48:01 +0530
Message-ID: <CAAhSdy3qFZoK16gh=F5jk7QC3q_xMOJbCmigCsQ1d7WYoSR9nA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level
 Makefile
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup.patel@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_011815_973639_2EAA75CC 
X-CRM114-Status: GOOD (  12.62  )
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

On Tue, Dec 21, 2021 at 1:15 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Nov 29, 2021, Anup Patel wrote:
> > We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile
>
> Nit, wrap closer to 75 chars.

Okay, I will update.

>
> > which will allow users to pass additional compile-time flags such
> > as "-static".
>
> In case there's any hesitation in applying this (Paolo asked if this was just for
> debugging in v1), being able to pass "-static" is helpful for our environment as
> our test systems have a funky and minimal configuration (no gcc, and the interpreter
> is in a weird location).  Running selftests either requires building them with
> -static or creating a symbolic link for /lib64/ld-linux-x86-64.so.2.  It's generally
> easier to just tell people to compile with -static.
>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
>
> Reviewed-and-tested-by: Sean Christopherson <seanjc@google.com>

Thanks, I am planning to queue this for 5.17. Currently, I am waiting for
some reviews on the PATCH4 (last patch).

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
