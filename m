Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70142C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNnhiSrvefHhpa9y0uCRxG+cE/cQsl/wJU1gAf97X/U=; b=MGmh0bLsOkUs/2
	wRqXQAe0GP/0Vb6d+oKHrdfriDEBPV4Qfb6mWF8oVLoU7HaWZbD7iO6XtNUilxuGh0ofzs/rDfOvi
	IK2Kr+Zhu7vXaX28annpuKFNMZjLL2oNhVpTcGHJsk4ofiW6hqfM4um2XArTiNeEE+2gdbSpHwrns
	Z9lkKBN2UAK2LCNFxtIXpaJI8pdbeenhhAlQsPKVIZP/rfMleRZbffDtVv9GYp0oUa4VidO+CUBsx
	cAMGI2YnG9hSB1CFu+z27Uyf+TiVGYz391iTKub1A1AFHyPDcvb7t0CGmTjskB/jzXJAn63GMJKk6
	siH1fyYHrSfnCa/iYsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyVUN-009HUw-1U;
	Thu, 02 Nov 2023 11:03:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyVUK-009HRG-1D
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 11:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698923027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o+sUvKh0Fq9LjCXdXIyTK4b/elLQxFDSaWn4T3QHjyo=;
	b=IU52yQO0qxcz35Fs/5V0uCHcBEKycD54EakTck4PlEo8a2TRHMfHGgGhw+SGPR6npcKNxx
	9+od4kqgrYIcPrPVkNx6QW0aE35QpNGv5BF5rrD8qn6ngT2zhAq2MRaSfxDBZAcesTlW9D
	eTMcLXREvK87atjn3VTZKgiGZXDUMmk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-pKR0-og0M8Kh-Sm_nHiMhQ-1; Thu, 02 Nov 2023 07:03:44 -0400
X-MC-Unique: pKR0-og0M8Kh-Sm_nHiMhQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9d2ab03a586so54295366b.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 04:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698923023; x=1699527823;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+sUvKh0Fq9LjCXdXIyTK4b/elLQxFDSaWn4T3QHjyo=;
        b=UPa3jSOdyIxu/w7DcycLpx7eshB1sgNn7Psa2nfpcPwTdQPPSgia0FFzEs+4vjHe1n
         A1aV23YEohgDdqdJz5SusNCKjBgOXPP3dUgDSI5cf2zcJjtbzAC0Hmherl4KBfsbWAlD
         AfU2lzMemzr1h7/KY5SL/Ruey+9n5sOHK9Q7C7ry5l3ygrOMX/p3tSVNZSlXm4eLj3Jl
         82SH3iUXoOvmrhs88seGaN4BcGzhtQSEd6HIzmAbNi88bdYH/xF9wBh5rPNhT6AiwO9Q
         8LrIJCEFub7G1mzFa7Xvmxd3/v6GIABE368Ro+pZgkSCsXOyA4cvr4aeeeCqGvdIv4eZ
         HQBQ==
X-Gm-Message-State: AOJu0Yzr+aN4eeDr7tq4J05YSz5svLGx58nBoucjI7eM8HBFaNnZy6ei
	08TmCal7geZPfZKXsZnngu7lKkbRHwS0R7pH72v5urTCfgpNLdi/kbUPr1Li4I3TlXxrtvpU+gZ
	JKbCVhHN3zut56TEZIxRLsnzdubjO
X-Received: by 2002:a17:907:7b99:b0:9be:30c2:b8fd with SMTP id ne25-20020a1709077b9900b009be30c2b8fdmr4830858ejc.66.1698923023218;
        Thu, 02 Nov 2023 04:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAextU6brGleAr873WsCzugduD1+qH+WMku84F2ppJAKPGqD6aYcxwyzrmazywVumiiQ5fXg==
X-Received: by 2002:a17:907:7b99:b0:9be:30c2:b8fd with SMTP id ne25-20020a1709077b9900b009be30c2b8fdmr4830827ejc.66.1698923022777;
        Thu, 02 Nov 2023 04:03:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id hk22-20020a170906c9d600b0099cb0a7098dsm1010698ejb.19.2023.11.02.04.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 04:03:42 -0700 (PDT)
Message-ID: <496b78bb-ad12-4eed-a62c-8c2fd725ec61@redhat.com>
Date: Thu, 2 Nov 2023 12:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
To: "Huang, Kai" <kai.huang@intel.com>,
 "Christopherson,, Sean" <seanjc@google.com>
Cc: "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "mic@digikod.net" <mic@digikod.net>,
 "liam.merwick@oracle.com" <liam.merwick@oracle.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "amoorthy@google.com" <amoorthy@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tabba@google.com" <tabba@google.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "Annapurve, Vishal" <vannapurve@google.com>, "vbabka@suse.cz"
 <vbabka@suse.cz>, "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "maz@kernel.org" <maz@kernel.org>, "willy@infradead.org"
 <willy@infradead.org>, "dmatlack@google.com" <dmatlack@google.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
 "Xu, Yilun" <yilun.xu@intel.com>, "qperret@google.com" <qperret@google.com>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>,
 "ackerleytng@google.com" <ackerleytng@google.com>,
 "jarkko@kernel.org" <jarkko@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Wang, Wei W"
 <wei.w.wang@intel.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com>
 <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
 <32cb71700aedcbd1f65276cf44a601760ffc364b.camel@intel.com>
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
In-Reply-To: <32cb71700aedcbd1f65276cf44a601760ffc364b.camel@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_040348_499066_CB9B1D60 
X-CRM114-Status: GOOD (  13.62  )
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

On 11/2/23 10:35, Huang, Kai wrote:
> IIUC KVM can already handle the case of poisoned
> page by sending signal to user app: 
> 
> 	static int kvm_handle_error_pfn(struct kvm_vcpu *vcpu, 
> 			struct kvm_page_fault *fault)                                               
> 	{       
> 		...
> 
>        		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
>               		kvm_send_hwpoison_signal(fault->slot, fault->gfn);
>                 	return RET_PF_RETRY;                                          
>         	}
> 	}

EHWPOISON is not implemented by this series, so it should be left out of 
the documentation.


> Currently as mentioned above when
> vepc fault handler cannot allocate EPC page KVM returns -EFAULT to Qemu, and
> Qemu prints ...
> 
> 	...: Bad address
> 	<dump guest cpu registers>
> 
> ... which is nonsense.
> 
> If we can use memory_fault.flags (or is 'fault_reason' a better name?) to carry
> a specific value for EPC to let Qemu know and Qemu can then do more reasonable
> things.

Yes, that's a good idea that can be implemented on top.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
