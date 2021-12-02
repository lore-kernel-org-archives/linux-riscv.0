Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8E2C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndgXJ4R5cfAhy4RRf9k0sx8/EG5GgwY1tqx4OKtm8J4=; b=NWvPwjtWZWrSQM
	IcbNharNWWtnQ9z2ggazodLGTyWOPxtinIw0CW7Bz5InNFeOehlmFBf/d2wLjryTwHKiNtCAXvAKw
	AK1EJcrlVpIy9sbiODqRdG3lEdd64Z77gwEbxxGFQ4WznNREYTJyd6bYuLGfBIB8yhyJDzZixl6SX
	PuaFL++B4+vsMz1MBy+PofbnI288rihrJOZCFHCdBRh6k4UBazfSw96E576NzOzkppVUIEHFcJcyC
	C7zS2dCXggXE0bPLvYV36vgtej6xO8IbwUoZdp5F/v8H9EYbjmpAc4zZzZ+WjFUJv5C1Ho8Bl86rv
	kkCgXb9y60FXMUVL5ocQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msjNe-00Bq6c-EP; Thu, 02 Dec 2021 10:31:58 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msjNO-00Bq0v-Ab; Thu, 02 Dec 2021 10:31:43 +0000
Received: by mail-ed1-x52e.google.com with SMTP id l25so113865695eda.11;
 Thu, 02 Dec 2021 02:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N6k1dm8k+AuxT/kkINJ2uWzQD41QhKsh8yex3G7gZCI=;
 b=G/KcWY4NdiSiLbGwFVbMpplGKklwuLS8kzHzGur5jlThpat8rYTmvJEuvKnby0ikS5
 iMXoT3JaN8/6uGdTfqTV64IRpBhuVbTwgoqPRIuAnlOPg4YXFHbD8LSvudKuqUlIFuXo
 1B6vYQLwbiH5PukJHZ2d+B/hG4wyhNqTRUH+WJYFxX/aAnWG5ofBg3HiNT96ZFyJ9nM8
 RMfYqLt3L+O6eWXJQeNtUQxDFA97RXOHZgU97mHvKCkbWJ/oRSQWohVhbpxKbOUFzh4K
 /WIYiCEYMqmZsjs0IaWV39/CdP/UEiDeWQkZevioyJUXTo+ileWjeLZdsdLPjDzl5ytc
 MDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N6k1dm8k+AuxT/kkINJ2uWzQD41QhKsh8yex3G7gZCI=;
 b=bWKIdJz1Vvsykprv9OOgOEkCYWeaNTg2ih9AexZ1CLJSYrpewzSQ6gkBuhhkV8gLsf
 FUMEvGTowmplr/Jz+LgzyYiRpz3FL5EUEX+s8KJVNTOarWnh1IAEtDX/U1+yZAblISfn
 ioR1Gu68urjY1wNmRAptIGh0ncFBp9g/2DUYmHbDkNuF24dfzUS8vbw0hnxoHRrL2hb6
 WlBFViAcm6omCsY1xevH8enZ+KDnY5NpVnonkxrRXLeOAi+3fxVPxQIyAQK7+PoU0QAx
 u/CkPK0u5FxcWv2wiabdKvbnAnuqOpzowkJ3zFC57jTI70ZQcwLN5Exs40WRFxTNYlaQ
 /AVA==
X-Gm-Message-State: AOAM5328fj6R0W4VcBVNlQRVBX62AKubqiGrPlhhrjQukUyIxYYHtoDY
 y+M7xNxCxq1ksjyfKX9fM0s=
X-Google-Smtp-Source: ABdhPJwhpBxx1yFRODBtJrFnn3nCW7H/sTu+w+jLDDEQAemKg7xUPHKBK5f7DJw2WZKCGsUGKU9xRg==
X-Received: by 2002:a17:906:ce2a:: with SMTP id
 sd10mr14431289ejb.154.1638441099804; 
 Thu, 02 Dec 2021 02:31:39 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id w5sm1912110edc.58.2021.12.02.02.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 02:31:39 -0800 (PST)
Message-ID: <6200f141-8e6f-fe68-9539-22aa68559cb7@redhat.com>
Date: Thu, 2 Dec 2021 11:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>, Wei Huang <wei.huang2@amd.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
 <YaUiEquKYi5eqWC0@google.com>
 <880a5727-69d1-72a1-b129-b053781625ad@redhat.com>
 <458c0819a578ba854f00089bc312c8faa177a81a.camel@redhat.com>
 <32eabe7d270e5a466ba2d9345b4270b8fe27700c.camel@redhat.com>
 <Yagoo7R8P5xVilsj@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yagoo7R8P5xVilsj@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_023142_415023_36028864 
X-CRM114-Status: GOOD (  14.20  )
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

T24gMTIvMi8yMSAwMzowMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBIbW0sIHRoYXQg
c3VnZ2VzdHMgdGhlIGJ1Zy9lcnJhdHVtIGlzIGR1ZSB0byB0aGUgQ1BVIGNvbnN1bWluZyBzdGFs
ZSBkYXRhIGZyb20gIzQKPiBmb3IgdGhlIElzUnVubmluZyBjaGVjayBpbiAjNSwgb3IgcmV0aXJp
bmcgdW9wcyBmb3IgdGhlIElzUnVubmluZyBjaGVjayBiZWZvcmUKPiByZXRpcmluZyB0aGUgdklS
UiB1cGRhdGUuCgpZZXMsIHRoaXMgc2VlbXMgdG8gYmUgYW4gZXJyb3IgaW4gdGhlIGltcGxlbWVu
dGF0aW9uIG9mIHN0ZXAgNS4gIEluIAphc3NlbWJseSwgYXRvbWljIG9wZXJhdGlvbnMgaGF2ZSBp
bXBsaWNpdCBtZW1vcnkgYmFycmllcnMsIGJ1dCB3aG8ga25vd3MgCndoYXQncyBnb2luZyBvbiBp
biBtaWNyb2NvZGUuICBTbyBlaXRoZXIgaXQncyB0aGUgZm9ybWVyLCBvciBzb21ldGhpbmcgCmlz
IGdvaW5nIG9uIHRoYXQncyBzcGVjaWZpYyB0byB0aGUgbWljcm9jb2RlIHNlcXVlbmNlciwgb3Ig
aXQncyBhIG1vcmUgCm11bmRhbmUgaW1wbGVtZW50YXRpb24gYnVnLgoKSW4gYW55IGNhc2UsIEFW
SUMgaXMgZGlzYWJsZWQgZm9yIG5vdyBhbmQgd2lsbCBuZWVkIGEgbGlzdCBvZiBtb2RlbCAKd2hl
cmUgaXQgd29ya3MsIHNvIEknbGwgZ28gb24gYW5kIHF1ZXVlIHRoZSBmaXJzdCBwYXJ0IG9mIHRo
aXMgc2VyaWVzLgoKUGFvbG8KCj4gSXQgd291bGQgYmUgaGVscGZ1bCBpZiB0aGUgZXJyYXR1bSBh
Y3R1YWxseSBwcm92aWRlZAo+IGluZm8gb24gdGhlICJoaWdobHkgc3BlY2lmaWMgYW5kIGRldGFp
bGVkIHNldCBvZiBpbnRlcm5hbCB0aW1pbmcgY29uZGl0aW9ucyIuIDotLwo+IAo+ICAgIDQuIExv
b2t1cCB0aGUgdkFQSUMgYmFja2luZyBwYWdlIGFkZHJlc3MgaW4gdGhlIFBoeXNpY2FsIEFQSUMg
dGFibGUgdXNpbmcgdGhlCj4gICAgICAgZ3Vlc3QgcGh5c2ljYWwgQVBJQyBJRCBhcyBhbiBpbmRl
eCBpbnRvIHRoZSB0YWJsZS4KPiAgICA1LiBGb3IgZXZlcnkgdmFsaWQgZGVzdGluYXRpb246Cj4g
ICAgICAgLSBBdG9taWNhbGx5IHNldCB0aGUgYXBwcm9wcmlhdGUgSVJSIGJpdCBpbiBlYWNoIG9m
IHRoZSBkZXN0aW5hdGlvbnPigJkgdkFQSUMKPiAgICAgICAgIGJhY2tpbmcgcGFnZS4KPiAgICAg
ICAtIENoZWNrIHRoZSBJc1J1bm5pbmcgc3RhdHVzIG9mIGVhY2ggZGVzdGluYXRpb24uCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
