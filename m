Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF41C47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 22:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4MzLMDr9CxZFDqUt/MxbjqfH7a4sJ6Yi0x0pjik2uE=; b=gQHuuNIrJclrBn
	8u14OPMWyctF62oTA34uponslK9a2k3NbFBhKyb/8Eku42lq608+LGNoNGFTSxqpKgdqbRfEebF4i
	w1/P2SfxXFL9Dvzs2tFxI+oG3+iRa1amLIf4b+3hUbYOGRufgsqV2q9Us5Nmf96PDbXaNUd3MC8hx
	p9icd4ukwSAHFAkLEEfN/9CtUUb6rIdvSxRtiOC5I9rSCTEA3fmfqEfjIbXixbTWWHxNTqBXGbicm
	6Eu5I0v5HCtIoVdn0b+/R68DsGYPEM5302RuQrkH1MJvYvKGNR67gYXVWlXHaodkc6kFpITuBOnfU
	3ROXCpD4Y4XjjbYZmP/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdHye-00000006tHW-47oG;
	Thu, 22 Feb 2024 22:55:40 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdHya-00000006tEj-33GR
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 22:55:38 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5ee22efe5eeso5101437b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 14:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708642532; x=1709247332; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vd/YICqtxLMDMc5n5d3K7q6H9URrpma0RkwQ+FIE2QY=;
        b=d7jmnWAb6609q3uplt8VEFqfhAp8hPfjRAersgpUdV5pd9R3YvlmIVKJ9e9GHaQiM+
         xc3nZTaIvBUWhJyl8eSyrEFLgU28BJd7YHBBan3Hx0NS08OzJq6g729GrxP7A8Dk88ja
         gfp2KV9ds/W6Aj1fkQheTZn8UFVL0JHkFqKkkrhJjm1DZtxuiwt3qiaBjuC0+lWdI3a1
         4Shx4wnTzUuKUtolmHL9OYqs9h2AiaJIr38oZzM589Zlb7lf8KlADw2kTzidtYAI4C4o
         EofmM0O2e3LZaLyckVDVxg4qu9B8F14l6pAO7NPwnsVZuFImu6MBuPEXT1DzupfEkymV
         H+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708642532; x=1709247332;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vd/YICqtxLMDMc5n5d3K7q6H9URrpma0RkwQ+FIE2QY=;
        b=w25MdKn1JVpMkdYDfQLG2uxTdqzLdc0Q2Nb+NyH7SprTU+NF15ikKy0YToiMv1oluL
         e2IU/K781tb+1BI7w3SzFaO0FeWkqQUJJGC62ObiO11s8UCmjqqvk7a9bEx0YJmy5Qut
         gYFDmZJCqwLDMQV7lyNsBqOP1W5Ez79Uf2W7nawPg4Q4Ad0+GhljMaWagUFr03FA3E2h
         GiSUhoAWGTSTPEvRwCLAamZ1oQex+9oeNkxKERLtiG19biJVvXJQ14nwucVRdsrnDbWG
         FNtCl8fl0iFBC/QIJg9K+x+FAY+8o1DwDMjPIjcZtFnZqezZ/213FZOZM9CFV6CPRYAK
         QlpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVryN8aGauUKmJE2ENFJaWK4gLvM3HW+IYzu0Memw5iFuU3eNwh4OgSPAZASVLqy+S3sXaEa6acCoelNJQIDxB7cJ13629efSR9/Uy58293
X-Gm-Message-State: AOJu0YyNqtUivPz5aE9rJ+g5p2ch71MWu59XPlc8naK8Xkj1SFTryVK2
	1xWzrikBRT33qXsEZkffwvhtcur9/DDcqtBFHbJD7Na7EFL8xqQPUYuzp9xUFNqfwChizn3gCm+
	T9g==
X-Google-Smtp-Source: AGHT+IH6zbDx9owFk0HWBGgG9KN5obudLpTf6CD+r6Pc0oEDuyl4v9GZAk2ErtxIMUz9+tCkdL7Tsne7vIE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:9150:0:b0:608:a1ff:6c39 with SMTP id
 i77-20020a819150000000b00608a1ff6c39mr130883ywg.2.1708642532143; Thu, 22 Feb
 2024 14:55:32 -0800 (PST)
Date: Thu, 22 Feb 2024 14:55:30 -0800
In-Reply-To: <ZdfNwhe2s0Mn2gB4@google.com>
Mime-Version: 1.0
References: <20240203000917.376631-1-seanjc@google.com> <20240203000917.376631-11-seanjc@google.com>
 <ZcKYRsNUAngWGy2a@google.com> <ZdfNwhe2s0Mn2gB4@google.com>
Message-ID: <ZdfQ4jI8yT-bvbV4@google.com>
Subject: Re: [PATCH v8 10/10] KVM: selftests: Add a basic SEV smoke test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Peter Gonda <pgonda@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_145536_843329_BCF2D697 
X-CRM114-Status: GOOD (  13.63  )
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

On Thu, Feb 22, 2024, Sean Christopherson wrote:
> On Tue, Feb 06, 2024, Sean Christopherson wrote:
> > On Fri, Feb 02, 2024, Sean Christopherson wrote:
> > > +int main(int argc, char *argv[])
> > > +{
> > > +	TEST_REQUIRE(is_kvm_sev_supported());
> > 
> > This also needs
> > 
> > 	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV));
> > 
> > to handle the case where the platform supports SEV, i.e. /dev/sev exists, but
> > KVM doesn't support SEV, e.g. if TDP is disabled, if SEV was explicitly disabled
> > via module param, etc.
> 
> Thinking more about this, I think we should simply delete is_kvm_sev_supported().
> (a) it obviously doesn't query _KVM_ support, and (b) if KVM says SEV is supported,
> then it darn well actually be supported.

Ugh, and selftests also need to handle the scenario where SEV is enabled, but all
ASIDs are assigned to SEV-ES.  We could try to create a dummy VM and check for an
-EBUSY return, but that is ugly and could result in missing KVM bugs due to tests
being skipped instead of failing.

That's a future problem though, because I think we'll need new KVM functionality
to surface that information.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
