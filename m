Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B89FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 10:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yG3vevbkdBmrq9jyF527hw8dQq+WIYV6mRqKK0t8qL8=; b=zZ3Us1vT9xfy8Z
	b5+E+BUtUgmIi5j9lhLXZFd35a4Aai7EfxA3liOKVO1PPRV8txkVTlRxhPGu7HmQitWKSscd1E2sb
	klqFLmweazUXVdyfO7KQLJb+24T2Q480S8C/1HiJjwgchKU8FD/OVnkLmSVnfMONkWMJaW2/bQaWU
	5wz0Yq3LPTrrSQROrJnMPjI3Cb73cltmwlbfk83hBE7fbGIbVvXkKClAsMZnrjmOg6P5kw1IKJqa2
	7bjXM9lX3zKaeaKdiJRoO/mSLVEmrMhBB38GYskJIY3opDRs1pI5ZUJC3aWZDVCFiMbKQUXH6RTxb
	vdFXMpXad8a1fsSMJZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyV0K-00982P-2Y;
	Thu, 02 Nov 2023 10:32:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyV0H-00980z-17
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 10:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698921162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EePgrsn5C6IrnNIxegoYsuWMp1Sc1phl1cmFpN1d7s8=;
	b=L46DUtDIQz53ccRCdQJFJW+IAJeOTCUlk/sx4p80wcznfruR810GKiOwtP4ylzCiGlKFDX
	podk5YYZT9sfsW7qPcP6fVrvomodgFreTYDjcy6BU0i0uaDplExrcjosRKYpmitAczB1Dh
	2/MHXbm+gWrsNdckstPhqNzG0zDlYQ4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-mpdyBsz1PriD-u6y6mqchw-1; Thu, 02 Nov 2023 06:32:41 -0400
X-MC-Unique: mpdyBsz1PriD-u6y6mqchw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae7663e604so53086566b.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 03:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698921160; x=1699525960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EePgrsn5C6IrnNIxegoYsuWMp1Sc1phl1cmFpN1d7s8=;
        b=GSMiUCgLwg9IOm3fUx1gvlg39qMNcRYKWs1ljerbn2MnXmqSyPks2etCokImSv3z7t
         0VNL8KhJYqDLo5iV9jJajjDtctBrNdC77cE4XasKEKIebnWVknaQeSr+NOXvj+eiYJsR
         Oo4okYlJYIJpLEETLEKl0iqe5+48XAAC4kAxkvP2yOUD3KKvus7qBqMFnuSFm/uJuST7
         V6X26x7azgan6ep1cNPfgP3P7fyU2FwXrILBiEHuJPNkE7Zsi+cUVZvaZNvV19G05A3v
         uGX9smjaZuSU15R4XFzVk1UbnhbWh977rX9BQioZTh4yYF+r6GKuLS5a7ngQvRCv6Z55
         M9gw==
X-Gm-Message-State: AOJu0Yw1arEWJu3atizEywCK7O0GyxeA9VtoUz+pUUyOo84WoSXcECCd
	GoecyRP4QaGnG7KhlgTtWGHr9CU3jLulPc1mIS4oUHRE4phv9nYc4vx6zeyvL1whwWQ99N+RFJl
	+Sh5JocvY1xvrBOMv/s3E5LwngSAa
X-Received: by 2002:a17:907:70a:b0:9bd:9bfe:e410 with SMTP id xb10-20020a170907070a00b009bd9bfee410mr4134643ejb.72.1698921160411;
        Thu, 02 Nov 2023 03:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdKWTZCjPNQtOILp1najbjDKUZt1gJ0TmclwPTaP4Nu9rDAFXiy/5MsPxAUlznxhN/2PedEg==
X-Received: by 2002:a17:907:70a:b0:9bd:9bfe:e410 with SMTP id xb10-20020a170907070a00b009bd9bfee410mr4134618ejb.72.1698921159974;
        Thu, 02 Nov 2023 03:32:39 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id y13-20020a170906470d00b0099bd1a78ef5sm957651ejq.74.2023.11.02.03.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 03:32:39 -0700 (PDT)
Message-ID: <a03d0e36-7b38-4841-9c62-66c9029e388d@redhat.com>
Date: Thu, 2 Nov 2023 11:32:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 13/35] KVM: Introduce per-page memory attributes
To: "Huang, Kai" <kai.huang@intel.com>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "Christopherson,, Sean" <seanjc@google.com>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "maz@kernel.org"
 <maz@kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "willy@infradead.org" <willy@infradead.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc: "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "mic@digikod.net" <mic@digikod.net>,
 "liam.merwick@oracle.com" <liam.merwick@oracle.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>, "tabba@google.com"
 <tabba@google.com>, "amoorthy@google.com" <amoorthy@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Annapurve, Vishal" <vannapurve@google.com>, "vbabka@suse.cz"
 <vbabka@suse.cz>, "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
 "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
 "qperret@google.com" <qperret@google.com>,
 "dmatlack@google.com" <dmatlack@google.com>, "Xu, Yilun"
 <yilun.xu@intel.com>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>,
 "ackerleytng@google.com" <ackerleytng@google.com>,
 "jarkko@kernel.org" <jarkko@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Wang, Wei W"
 <wei.w.wang@intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-14-seanjc@google.com>
 <b486ed5036fab6d6d4e13a6c68abddcb9541d51b.camel@intel.com>
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
In-Reply-To: <b486ed5036fab6d6d4e13a6c68abddcb9541d51b.camel@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_033245_468228_A31D5BFB 
X-CRM114-Status: GOOD (  30.14  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMi8yMyAwNDowMSwgSHVhbmcsIEthaSB3cm90ZToKPiBPbiBGcmksIDIwMjMtMTAtMjcg
YXQgMTE6MjEgLTA3MDAsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4+IEZyb206IENoYW8g
UGVuZyA8Y2hhby5wLnBlbmdAbGludXguaW50ZWwuY29tPgo+Pgo+PiBJbiBjb25maWRlbnRpYWwg
Y29tcHV0aW5nIHVzYWdlcywgd2hldGhlciBhIHBhZ2UgaXMgcHJpdmF0ZSBvciBzaGFyZWQgaXMK
Pj4gbmVjZXNzYXJ5IGluZm9ybWF0aW9uIGZvciBLVk0gdG8gcGVyZm9ybSBvcGVyYXRpb25zIGxp
a2UgcGFnZSBmYXVsdAo+PiBoYW5kbGluZywgcGFnZSB6YXBwaW5nIGV0Yy4gVGhlcmUgYXJlIG90
aGVyIHBvdGVudGlhbCB1c2UgY2FzZXMgZm9yCj4+IHBlci1wYWdlIG1lbW9yeSBhdHRyaWJ1dGVz
LCBlLmcuIHRvIG1ha2UgbWVtb3J5IHJlYWQtb25seSAob3Igbm8tZXhlYywKPj4gb3IgZXhlYy1v
bmx5LCBldGMuKSB3aXRob3V0IGhhdmluZyB0byBtb2RpZnkgbWVtc2xvdHMuCj4+Cj4+IEludHJv
ZHVjZSB0d28gaW9jdGxzIChhZHZlcnRpc2VkIGJ5IEtWTV9DQVBfTUVNT1JZX0FUVFJJQlVURVMp
IHRvIGFsbG93Cj4+IHVzZXJzcGFjZSB0byBvcGVyYXRlIG9uIHRoZSBwZXItcGFnZSBtZW1vcnkg
YXR0cmlidXRlcy4KPj4gICAgLSBLVk1fU0VUX01FTU9SWV9BVFRSSUJVVEVTIHRvIHNldCB0aGUg
cGVyLXBhZ2UgbWVtb3J5IGF0dHJpYnV0ZXMgdG8KPj4gICAgICBhIGd1ZXN0IG1lbW9yeSByYW5n
ZS4KPj4gICAgLSBLVk1fR0VUX1NVUFBPUlRFRF9NRU1PUllfQVRUUklCVVRFUyB0byByZXR1cm4g
dGhlIEtWTSBzdXBwb3J0ZWQKPj4gICAgICBtZW1vcnkgYXR0cmlidXRlcy4KPj4KPj4gVXNlIGFu
IHhhcnJheSB0byBzdG9yZSB0aGUgcGVyLXBhZ2UgYXR0cmlidXRlcyBpbnRlcm5hbGx5LCB3aXRo
IGEgbmFpdmUsCj4+IG5vdCBmdWxseSBvcHRpbWl6ZWQgaW1wbGVtZW50YXRpb24sIGkuZS4gcHJp
b3JpdGl6ZSBjb3JyZWN0bmVzcyBvdmVyCj4+IHBlcmZvcm1hbmNlIGZvciB0aGUgaW5pdGlhbCBp
bXBsZW1lbnRhdGlvbi4KPj4KPj4gVXNlIGJpdCAzIGZvciB0aGUgUFJJVkFURSBhdHRyaWJ1dGUg
c28gdGhhdCBLVk0gY2FuIHVzZSBiaXRzIDAtMiBmb3IgUldYCj4+IGF0dHJpYnV0ZXMvcHJvdGVj
dGlvbnMgaW4gdGhlIGZ1dHVyZSwgZS5nLiB0byBnaXZlIHVzZXJzcGFjZSBmaW5lLWdyYWluZWQK
Pj4gY29udHJvbCBvdmVyIHJlYWQsIHdyaXRlLCBhbmQgZXhlY3V0ZSBwcm90ZWN0aW9ucyBmb3Ig
Z3Vlc3QgbWVtb3J5Lgo+Pgo+PiBQcm92aWRlIGFyY2ggaG9va3MgZm9yIGhhbmRsaW5nIGF0dHJp
YnV0ZSBjaGFuZ2VzIGJlZm9yZSBhbmQgYWZ0ZXIgY29tbW9uCj4+IGNvZGUgc2V0cyB0aGUgbmV3
IGF0dHJpYnV0ZXMsIGUuZy4geDg2IHdpbGwgdXNlIHRoZSAicHJlIiBob29rIHRvIHphcCBhbGwK
Pj4gcmVsZXZhbnQgbWFwcGluZ3MsIGFuZCB0aGUgInBvc3QiIGhvb2sgdG8gdHJhY2sgd2hldGhl
ciBvciBub3QgaHVnZXBhZ2VzCj4+IGNhbiBiZSB1c2VkIHRvIG1hcCB0aGUgcmFuZ2UuCj4+Cj4+
IFRvIHNpbXBsaWZ5IHRoZSBpbXBsZW1lbnRhdGlvbiB3cmFwIHRoZSBlbnRpcmUgc2VxdWVuY2Ug
d2l0aAo+PiBrdm1fbW11X2ludmFsaWRhdGVfe2JlZ2luLGVuZH0oKSBldmVuIHRob3VnaCB0aGUg
b3BlcmF0aW9uIGlzbid0IHN0cmljdGx5Cj4+IGd1YXJhbnRlZWQgdG8gYmUgYW4gaW52YWxpZGF0
aW9uLiAgRm9yIHRoZSBpbml0aWFsIHVzZSBjYXNlLCB4ODYgKndpbGwqCj4+IGFsd2F5cyBpbnZh
bGlkYXRlIG1lbW9yeSwgYW5kIHByZXZlbnRpbmcgYXJjaCBjb2RlIGZyb20gY3JlYXRpbmcgbmV3
Cj4+IG1hcHBpbmdzIHdoaWxlIHRoZSBhdHRyaWJ1dGVzIGFyZSBpbiBmbHV4IG1ha2VzIGl0IG11
Y2ggZWFzaWVyIHRvIHJlYXNvbgo+PiBhYm91dCB0aGUgY29ycmVjdG5lc3Mgb2YgY29uc3VtaW5n
IGF0dHJpYnV0ZXMuCj4+Cj4+IEl0J3MgcG9zc2libGUgdGhhdCBmdXR1cmUgdXNhZ2VzIG1heSBu
b3QgcmVxdWlyZSBhbiBpbnZhbGlkYXRpb24sIGUuZy4KPj4gaWYgS1ZNIGVuZHMgdXAgc3VwcG9y
dGluZyBSV1ggcHJvdGVjdGlvbnMgYW5kIHVzZXJzcGFjZSBncmFudHMgX21vcmVfCj4+IHByb3Rl
Y3Rpb25zLCBidXQgYWdhaW4gb3B0IGZvciBzaW1wbGljaXR5IGFuZCBwdW50IG9wdGltaXphdGlv
bnMgdG8KPj4gaWYvd2hlbiB0aGV5IGFyZSBuZWVkZWQuCj4+Cj4+IFN1Z2dlc3RlZC1ieTogU2Vh
biBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC9ZMldCNDhrRDBKNFZHeW5YQGdvb2dsZS5jb20KPj4gQ2M6IEZ1YWQg
VGFiYmEgPHRhYmJhQGdvb2dsZS5jb20+Cj4+IENjOiBYdSBZaWx1biA8eWlsdW4ueHVAaW50ZWwu
Y29tPgo+PiBDYzogTWlja2HDq2wgU2FsYcO8biA8bWljQGRpZ2lrb2QubmV0Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBDaGFvIFBlbmcgPGNoYW8ucC5wZW5nQGxpbnV4LmludGVsLmNvbT4KPj4gQ28tZGV2
ZWxvcGVkLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4+Cj4g
Cj4gWy4uLl0KPiAKPj4gK05vdGUsIHRoZXJlIGlzIG5vICJnZXQiIEFQSS4gIFVzZXJzcGFjZSBp
cyByZXNwb25zaWJsZSBmb3IgZXhwbGljaXRseSB0cmFja2luZwo+PiArdGhlIHN0YXRlIG9mIGEg
Z2ZuL3BhZ2UgYXMgbmVlZGVkLgo+PiArCj4+Cj4gCj4gWy4uLl0KPiAKPj4gICAKPj4gKyNpZmRl
ZiBDT05GSUdfS1ZNX0dFTkVSSUNfTUVNT1JZX0FUVFJJQlVURVMKPj4gK3N0YXRpYyBpbmxpbmUg
dW5zaWduZWQgbG9uZyBrdm1fZ2V0X21lbW9yeV9hdHRyaWJ1dGVzKHN0cnVjdCBrdm0gKmt2bSwg
Z2ZuX3QgZ2ZuKQo+PiArewo+PiArCXJldHVybiB4YV90b192YWx1ZSh4YV9sb2FkKCZrdm0tPm1l
bV9hdHRyX2FycmF5LCBnZm4pKTsKPj4gK30KPiAKPiBPbmx5IGNhbGwgeGFfdG9fdmFsdWUoKSB3
aGVuIHhhX2xvYWQoKSByZXR1cm5zICFOVUxMPwoKVGhpcyB4YXJyYXkgZG9lcyBub3Qgc3RvcmUg
YSBwb2ludGVyLCB0aGVyZWZvcmUgeGFfbG9hZCgpIGFjdHVhbGx5IApyZXR1cm5zIGFuIGludGVn
ZXIgdGhhdCBpcyB0YWdnZWQgd2l0aCAxIGluIHRoZSBsb3cgYml0OgoKc3RhdGljIGlubGluZSB1
bnNpZ25lZCBsb25nIHhhX3RvX3ZhbHVlKGNvbnN0IHZvaWQgKmVudHJ5KQp7CiAgICAgICAgIHJl
dHVybiAodW5zaWduZWQgbG9uZyllbnRyeSA+PiAxOwp9CgpSZXR1cm5pbmcgemVybyBmb3IgYW4g
ZW1wdHkgZW50cnkgaXMgb2theSwgc28gdGhlIHJlc3VsdCBvZiB4YV9sb2FkKCkgCmNhbiBiZSB1
c2VkIGRpcmVjdGx5LgoKCj4+ICsKPj4gK2Jvb2wga3ZtX3JhbmdlX2hhc19tZW1vcnlfYXR0cmli
dXRlcyhzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IHN0YXJ0LCBnZm5fdCBlbmQsCj4+ICsJCQkJICAg
ICB1bnNpZ25lZCBsb25nIGF0dHJzKTsKPiAKPiBTZWVtcyBpdCdzIG5vdCBpbW1lZGlhdGVseSBj
bGVhciB3aHkgdGhpcyBmdW5jdGlvbiBpcyBuZWVkZWQgaW4gdGhpcyBwYXRjaCwKPiBlc3BlY2lh
bGx5IHdoZW4geW91IHNhaWQgdGhlcmUgaXMgbm8gImdldCIgQVBJIGFib3ZlLiAgQWRkIHNvbWUg
bWF0ZXJpYWwgdG8KPiBjaGFuZ2Vsb2c/CgpJdCdzIHVzZWQgYnkgbGF0ZXIgcGF0Y2hlczsgZXZl
biB3aXRob3V0IGEgImdldCIgQVBJLCBpdCdzIGEgcHJldHR5IApmdW5kYW1lbnRhbCBmdW5jdGlv
bmFsaXR5LgoKPj4gK2Jvb2wga3ZtX2FyY2hfcHJlX3NldF9tZW1vcnlfYXR0cmlidXRlcyhzdHJ1
Y3Qga3ZtICprdm0sCj4+ICsJCQkJCXN0cnVjdCBrdm1fZ2ZuX3JhbmdlICpyYW5nZSk7Cj4+ICti
b29sIGt2bV9hcmNoX3Bvc3Rfc2V0X21lbW9yeV9hdHRyaWJ1dGVzKHN0cnVjdCBrdm0gKmt2bSwK
Pj4gKwkJCQkJIHN0cnVjdCBrdm1fZ2ZuX3JhbmdlICpyYW5nZSk7Cj4gCj4gTG9va3MgaWYgdGhp
cyBLY29uZmlnIGlzIG9uLCB0aGUgYWJvdmUgdHdvIGFyY2ggaG9va3Mgd29uJ3QgaGF2ZSBpbXBs
ZW1lbnRhdGlvbi4KPiAKPiBJcyBpdCBiZXR0ZXIgdG8gaGF2ZSB0d28gX193ZWFrIGVtcHR5IHZl
cnNpb25zIGhlcmUgaW4gdGhpcyBwYXRjaD8KPiAKPiBBbnl3YXksIGZyb20gdGhlIGNoYW5nZWxv
ZyBpdCBzZWVtcyBpdCdzIG5vdCBtYW5kYXRvcnkgZm9yIHNvbWUgQVJDSCB0byBwcm92aWRlCj4g
dGhlIGFib3ZlIHR3byBpZiBvbmUgd2FudHMgdG8gdHVybiB0aGlzIG9uLCBpLmUuLCB0aGUgdHdv
IGhvb2tzIGNhbiBiZSBlbXB0eSBhbmQKPiB0aGUgQVJDSCBjYW4ganVzdCB1c2UgdGhlIF9fd2Vh
ayB2ZXJzaW9uLgoKSSB0aGluayB0aGlzIGNhbiBiZSBhZGRlZCBieSB0aGUgZmlyc3QgYXJjaCB0
aGF0IG5lZWRzIG1lbW9yeSBhdHRyaWJ1dGVzIAphbmQgYWxzbyBkb2Vzbid0IG5lZWQgb25lIG9m
IHRoZXNlIGhvb2tzLiAgT3IgcGVyaGFwcyB0aGUgeDg2IAprdm1fYXJjaF9wcmVfc2V0X21lbW9y
eV9hdHRyaWJ1dGVzKCkgY291bGQgYmUgbWFkZSBnZW5lcmljIGFuZCB0aHVzIHRoYXQgCndvdWxk
IGJlIHRoZSBfX3dlYWsgdmVyc2lvbi4gIEl0J3MgdG9vIGVhcmx5IHRvIHRlbGwsIHNvIGl0J3Mg
YmV0dGVyIHRvIApsZWF2ZSB0aGUgaW1wbGVtZW50YXRpb24gdG8gdGhlIGFyY2hpdGVjdHVyZXMg
Zm9yIG5vdy4KClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
