Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCD9C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 14:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iygUYjWpoca7JLwYfz6IWxof6i1ZbGc08N5B/zeupvA=; b=X3X+SQ3kUSpx2S
	06GcdC50v2YzRfyy5pfhQ0w8RAIVfPhAfA7P27xh4QvAcgEvU+8vKF59qZxMysiYFEr1Zk7tfyJ/e
	GdHIKQKsWHi/wn5vqkXLbQh5sMrZHfLMFr1LWfAVZ72u1psu3z+uLmk4zym1L7KGrea2XR3dFxFGN
	5QEeZhTA/+89fhTaH33/dd4cLUhABTFjZjka1GdfpXENKYZ630XVDe4HWMc3g4xG3yCoo2dWMO5qi
	9QdDD7aE7NqecxtmQ+v5nj3uPLjvb6UE/rIbZrPm89d9e45Xn5JmU+bmYac5G0Spc4AiDKGcWyyLG
	+oqp06oScZNdLF/tospQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjgMU-00000001kTQ-3TTY;
	Mon, 11 Mar 2024 14:10:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjgMR-00000001kPz-2qBb
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 14:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710166224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hYh5tQchtq2eZoOZpBdnN7mPdgsWGKOiIWfUojl7Cjw=;
	b=dOY0cWdxlNMbe06V6Q4ejckEZE5uPRn1lNxX/H597mIZzVv4k9NxMeZF/2TcHdy1F3Fvs+
	2MNm6ht16igOmCJAEv2QyJbLulXJxDaZcBqc4Zs4il2sGfwHjXUqniBVMSaQjhd7UgXUQg
	mMJHDi/9pG5uGN4QHiFfxsI+af5SciE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-1pQg8XFNNdu6g_1L6y-ASA-1; Mon, 11 Mar 2024 10:10:22 -0400
X-MC-Unique: 1pQg8XFNNdu6g_1L6y-ASA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a448b3a36eeso163904866b.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 07:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710166221; x=1710771021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hYh5tQchtq2eZoOZpBdnN7mPdgsWGKOiIWfUojl7Cjw=;
        b=b9fkvjYqYE8494Swe4ZpbDuTi9XW4VEYux/VoCPU9++uNJN7bz55yJTK6LusWnknsi
         k2AIxl70CqyD7vipHpTECqrF9L/Zrymnhlym5C+S9SPZ8WPCs6GEFA1d8oS/5hwx3e1G
         ZXjVE5Jq/1phrNxzykqLnQI6ypysLQ1zpmSqHb8vdhaLnG2M9IIk5YPfrbdu6HwFPtHm
         j1WFVsoHF/97RFn2yfA39JY7uNOOOrcNctdOS0ya5NQyGfuSa+t5sHrcqGuQotWR/Pxn
         LwqIzYBDVcrpIyY2reN8Hq3pxGdm78qxRFPCT2/XDI6MT68tlejYSry0O5HLVzeOKRlC
         fpdg==
X-Forwarded-Encrypted: i=1; AJvYcCV+vjrl6ybOhKeSd4zcFHvnNPQvlkGodAWdb7J7mkB18sntCtMKjwJDL3qo3KwnmqjVGE8gaK2QCRfc5+ZjkkBqn3x/iwBkMBzIfmc2aTZO
X-Gm-Message-State: AOJu0Ywh59zFn6x63WjGtjSIF0uXr5zI8av/p74jF+pResPiaZFH55HZ
	UcwpHB9J8XMw/VXg7dQb+rIpDdjdlPSgWFfPp5HLQasK1SGpfENKrVdplkzfuZiQjQAjIRvoz1T
	GsQcqgW2/goC6SBEOkQImpDyIb6XT7BPnp/rH2jtzT2O02HqDnKESI+Drx4G3wUklvA==
X-Received: by 2002:a17:906:e2c5:b0:a45:f9da:b683 with SMTP id gr5-20020a170906e2c500b00a45f9dab683mr4046325ejb.66.1710166221176;
        Mon, 11 Mar 2024 07:10:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY7olz2nnq89L389z4fKjNkFp+/5FWfOwUlOJt4408T6wNJTGHcVc/O4EzaY14GwTb/wlJkg==
X-Received: by 2002:a17:906:e2c5:b0:a45:f9da:b683 with SMTP id gr5-20020a170906e2c500b00a45f9dab683mr4046305ejb.66.1710166220755;
        Mon, 11 Mar 2024 07:10:20 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.77.21])
        by smtp.googlemail.com with ESMTPSA id c23-20020a1709060fd700b00a44180ab871sm2900654ejk.50.2024.03.11.07.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 07:10:19 -0700 (PDT)
Message-ID: <6091398f-a2b3-4dc9-9f33-d7459a0a9594@redhat.com>
Date: Mon, 11 Mar 2024 15:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] KVM/riscv changes for 6.9
To: Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com>
 <CAAhSdy2Mu08RsBM+7FMjkcV49p9gOj3UKEoZnPAVk92e_3q=sw@mail.gmail.com>
 <ZesxeoyFZUeo-Z9F@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 xsEhBFRCcBIBDqDGsz4K0zZun3jh+U6Z9wNGLKQ0kSFyjN38gMqU1SfP+TUNQepFHb/Gc0E2
 CxXPkIBTvYY+ZPkoTh5xF9oS1jqI8iRLzouzF8yXs3QjQIZ2SfuCxSVwlV65jotcjD2FTN04
 hVopm9llFijNZpVIOGUTqzM4U55sdsCcZUluWM6x4HSOdw5F5Utxfp1wOjD/v92Lrax0hjiX
 DResHSt48q+8FrZzY+AUbkUS+Jm34qjswdrgsC5uxeVcLkBgWLmov2kMaMROT0YmFY6A3m1S
 P/kXmHDXxhe23gKb3dgwxUTpENDBGcfEzrzilWueOeUWiOcWuFOed/C3SyijBx3Av/lbCsHU
 Vx6pMycNTdzU1BuAroB+Y3mNEuW56Yd44jlInzG2UOwt9XjjdKkJZ1g0P9dwptwLEgTEd3Fo
 UdhAQyRXGYO8oROiuh+RZ1lXp6AQ4ZjoyH8WLfTLf5g1EKCTc4C1sy1vQSdzIRu3rBIjAvnC
 tGZADei1IExLqB3uzXKzZ1BZ+Z8hnt2og9hb7H0y8diYfEk2w3R7wEr+Ehk5NQsT2MPI2QBd
 wEv1/Aj1DgUHZAHzG1QN9S8wNWQ6K9DqHZTBnI1hUlkp22zCSHK/6FwUCuYp1zcAEQEAAc0j
 UGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT7CwU0EEwECACMFAlRCcBICGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRB+FRAMzTZpsbceDp9IIN6BIA0Ol7MoB15E
 11kRz/ewzryFY54tQlMnd4xxfH8MTQ/mm9I482YoSwPMdcWFAKnUX6Yo30tbLiNB8hzaHeRj
 jx12K+ptqYbg+cevgOtbLAlL9kNgLLcsGqC2829jBCUTVeMSZDrzS97ole/YEez2qFpPnTV0
 VrRWClWVfYh+JfzpXmgyhbkuwUxNFk421s4Ajp3d8nPPFUGgBG5HOxzkAm7xb1cjAuJ+oi/K
 CHfkuN+fLZl/u3E/fw7vvOESApLU5o0icVXeakfSz0LsygEnekDbxPnE5af/9FEkXJD5EoYG
 SEahaEtgNrR4qsyxyAGYgZlS70vkSSYJ+iT2rrwEiDlo31MzRo6Ba2FfHBSJ7lcYdPT7bbk9
 AO3hlNMhNdUhoQv7M5HsnqZ6unvSHOKmReNaS9egAGdRN0/GPDWr9wroyJ65ZNQsHl9nXBqE
 AukZNr5oJO5vxrYiAuuTSd6UI/xFkjtkzltG3mw5ao2bBpk/V/YuePrJsnPFHG7NhizrxttB
 nTuOSCMo45pfHQ+XYd5K1+Cv/NzZFNWscm5htJ0HznY+oOsZvHTyGz3v91pn51dkRYN0otqr
 bQ4tlFFuVjArBZcapSIe6NV8C4cEiSTOwE0EVEJx7gEIAMeHcVzuv2bp9HlWDp6+RkZe+vtl
 KwAHplb/WH59j2wyG8V6i33+6MlSSJMOFnYUCCL77bucx9uImI5nX24PIlqT+zasVEEVGSRF
 m8dgkcJDB7Tps0IkNrUi4yof3B3shR+vMY3i3Ip0e41zKx0CvlAhMOo6otaHmcxr35sWq1Jk
 tLkbn3wG+fPQCVudJJECvVQ//UAthSSEklA50QtD2sBkmQ14ZryEyTHQ+E42K3j2IUmOLriF
 dNr9NvE1QGmGyIcbw2NIVEBOK/GWxkS5+dmxM2iD4Jdaf2nSn3jlHjEXoPwpMs0KZsgdU0pP
 JQzMUMwmB1wM8JxovFlPYrhNT9MAEQEAAcLBMwQYAQIACQUCVEJx7gIbDAAKCRB+FRAMzTZp
 sadRDqCctLmYICZu4GSnie4lKXl+HqlLanpVMOoFNnWs9oRP47MbE2wv8OaYh5pNR9VVgyhD
 OG0AU7oidG36OeUlrFDTfnPYYSF/mPCxHttosyt8O5kabxnIPv2URuAxDByz+iVbL+RjKaGM
 GDph56ZTswlx75nZVtIukqzLAQ5fa8OALSGum0cFi4ptZUOhDNz1onz61klD6z3MODi0sBZN
 Aj6guB2L/+2ZwElZEeRBERRd/uommlYuToAXfNRdUwrwl9gRMiA0WSyTb190zneRRDfpSK5d
 usXnM/O+kr3Dm+Ui+UioPf6wgbn3T0o6I5BhVhs4h4hWmIW7iNhPjX1iybXfmb1gAFfjtHfL
 xRUr64svXpyfJMScIQtBAm0ihWPltXkyITA92ngCmPdHa6M1hMh4RDX+Jf1fiWubzp1voAg0
 JBrdmNZSQDz0iKmSrx8xkoXYfA3bgtFN8WJH2xgFL28XnqY4M6dLhJwV3z08tPSRqYFm4NMP
 dRsn0/7oymhneL8RthIvjDDQ5ktUjMe8LtHr70OZE/TT88qvEdhiIVUogHdo4qBrk41+gGQh
 b906Dudw5YhTJFU3nC6bbF2nrLlB4C/XSiH76ZvqzV0Z/cAMBo5NF/w=
In-Reply-To: <ZesxeoyFZUeo-Z9F@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_071039_801644_6607D2B5 
X-CRM114-Status: GOOD (  12.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/8/24 16:40, Sean Christopherson wrote:
> You're missing the point.  I don't care when patches land in the RISC-V tree, nor
> do I care that you made a last minute tweak to fix a bug.  I care when commits
> show up in linux-next, and*none*  of these commits were in linux-next until
> yesterday.
> 
>    $ git tag -l --contains 2c5af1c8460376751d57c50af88a053a3b869926
>    next-20240307
>    next-20240308
> 
> The*entire*  purpose of linux-next is to integrate*all*  work destined for the
> next kernel into a single tree, so that conflicts, bugs, etc. can be found and
> fixed*before*  the next merge window.

Indeed, and this is more important as more work is routed towards 
different trees.  At this point we have 5 more or less active 
architectures, and especially in selftests land it's important to 
coordinate with each other.

Anup, ideally, when you say that a patch is "queued" it should only be a 
short time before you're ready to send it to me - and that means putting 
it in a place where linux-next picks it up.  For x86 I generally compile 
test and run kvm-unit-tests on one of Intel or AMD, and leave the 
remaining tests for later (because they take a day or two), but in 
general it's a matter of days before linux-next get the patches.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
