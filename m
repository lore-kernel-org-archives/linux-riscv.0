Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7101EF94CB1
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 21:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lGdUvgrcVBK/uyhGc7zz1bkTwFCgQq237H0pvyeBAk=; b=n/3I3jv9sfJFmK
	8MS4rEoweZHM5UWr1hxRKaywR82MilRjCEdT1ahUTRBnvpBpOL42M7qFNvey0DkBpFpzcTwGefs4O
	D3JAySEO6RtMSSUTMf/Jw1WnTswHGuLlEaWZ4Zo+zqJiCxcRprXV+7N2nKLssRTq9hNAtm4v2URNE
	7hZNOEOiTROBfcwRtMYzo9tIjFute/ZcxoALDNRiMEmcsPHLsAIy8nx6naedduuEMRJXkIluqq+zI
	BccV+X/c64nyq8E6pJ068OZK2mqxypXUGIGxnXEx3sB0EpmFbrnW+uwMbdPcjSY6j0pG2f08Nj9Bu
	Q3vbRo/HpmGYDnxOWzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFIDA-000000099n1-1tJd;
	Tue, 21 Apr 2026 21:00:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEat-00000008wtd-1bom
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 17:09:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so264735e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 10:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776791340; cv=none;
        d=google.com; s=arc-20240605;
        b=ZBoDRrvpgZ6ClWypLFpiYkZO75e0JYBlaB7/bg3jykOs2GgzKh5c8W2VmoPwriZV1v
         H8vQNYAioo0pezfc+T/YoovQax13nSswgJwllD0B0QMwM+Ongl9lbe1B2T+BPTOWY13R
         tghRn7roVS6+YAxMvgGcvMU0XoRpiZzjiml2o1qRTdd3jlV5Ta3lFkCpdU8ciRgf0Qo2
         0yEfkmTE6aPne+3GcCUYPu/x+96YNh5aKS5Ta0avdV1cuLJ8/6+4v6awqC/z8DjcJNXV
         Z37ZVd42183N66MMEzIj0nLF3fEcCxOqAQxYCWXZtKgEUqP39UDHxkfVHWhbNijvDUqo
         WIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HFQ8wxNql59DNKoY4m4ShNnIhY0FuV9hRkmF8YGbPEM=;
        fh=leusVvb8TsIPBM+PjTV4g8o/8rAkjD6F1K0iac8A0rM=;
        b=j1ziuGqkiDUdag4tHze9KvFLxGRxck2uXiYH/piOqX3Wl8upJ0JcQMGc7d+opH/8a2
         ktU8Eit1UueMTjTfa9l5pUuVNObqnZ9Og4DMf0jZ9HOf1pgWw2L2LoOsCxCoaARRGQ5l
         MEp4zMVe2oPwWr18kSiLrnuKkyXsxzb+JNJlXOmIkKBkaudm8F2X8VUjo5nJOAXJ0rI+
         ntESIKO1B957hFu0fIn6cwok7nxgp9HIyQ+Qr22kCz+M5KNoCjSKtbu6TDflXXLYTIvR
         rm38kE1y4D6KXSuFMh8cNq3HyqWRjErhiLdBaea7pa2Hq420HAUSO3MEqD0swWk6aKzZ
         9YVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776791340; x=1777396140; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFQ8wxNql59DNKoY4m4ShNnIhY0FuV9hRkmF8YGbPEM=;
        b=C9bZjX2cjYrnCBFxMdgqdiwkM91br/2urbqWI63+ufBN6mONu9YYqMz54tLXLaVti/
         G9TJfav65KjFReBbknpxm3WBVHWv20bvceqtnuTuIwZSZWLvPzNvGiUprWSBaYnRIJ1S
         VdV2BneoMifCaYUN3gnoFdS+fUjSqem/M48BlZ2PdZfdDOU1HbOe0eFMrcfm1+A0goxM
         gDLHYXkaytbgyy+yCIBkWfNaposVZ1vyNOHY2D05C+15i7gniN4CFSLXlZR1gkePlvwX
         0fclMUG/rZa6tUn9B7/DxJ1cGJ7ECwxZOc4NgXyfoLf6j73UYE4fjAT8B6Y3Byx2CzhJ
         lWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776791340; x=1777396140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HFQ8wxNql59DNKoY4m4ShNnIhY0FuV9hRkmF8YGbPEM=;
        b=Sg69nocjpjFS8tYAxBA0VdBACov5DMLwN9GyrX3L3miQMtmgDMbrsIqrh43g9PRE5S
         TFq0EvgxCDW7j84detzzus0/xiXL5VfOzfZYRCK1zr3ybPuKNIgh5UgOUqs8PoM0uvFw
         BVhNf7ePk3vAwW2CQkAr/SA/Rq4OyiN1hJCp/kB1O9VoX24LZy/vxiJG4UeDoaQdIqvu
         Y6KT1rh3FiOoWgu0vAQKED25mWgembWm72E9YsBipyBTMe9MWvnPstW3n7eOS60MLCBW
         2DNDnjHbVL/3T6v9sVTW2rjm4AVkxMexwWkmuA/tdnJQGT0mZBJ+3/Y++NuuEzrAii0N
         OZ8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9DAeb3psLLkrkWup6C8TcNpFdOArk8sUnSuI2BmLA+8TpWRY6MIs8LEHWi8Ignb5eLqWchzWjNDRBNgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNlbqOJfZs8tTwFNWu5DtsC8KCgWTRVXhX87ROfH7kYY/uQ9Wc
	gUzPW3fBhcOuq6gAXh7/PB/koczS3gfNYliC/Q9RgnGODezaI3mNP/TCKgcBqEqFix6R0zR7j7N
	tbHhWddtqYvG2lgDapHAEWWzdBKTFQVfXhDoYfIsE
X-Gm-Gg: AeBDietD4PX0LrNoxmf118nXyRT3JqufK6dA88cbvgMe4uuTrfsaEWbHvI+SZxxfb6t
	+CICgk5FxiLzguCjrAKvCVQF1lFapixBUFcnIArNQzL5NZeJQmrAcQIDD1wiAM5CWukx0M6dQ2J
	YBdedTEYVukGdaGQ8NV+DDfN6ruVzRI0hUp5rhUJJijmCcCSKH/959VX21/xQjAiXLpjNFZo0R/
	fxU8JGyU8SaN+wJth38i6NPPxuiB/Q9u/cTk4cmOairU3zFR2rjBLBVlJOttTQUaVWcUJaLNiNa
	8j0xpx5S7FV1M3Fd1oX5R6LWBTbaaLv7TBlstUc=
X-Received: by 2002:a05:600d:6443:10b0:488:c4b2:e832 with SMTP id
 5b1f17b1804b1-489013bd895mr2808755e9.3.1776791339707; Tue, 21 Apr 2026
 10:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260410151746.61150-1-kalyazin@amazon.com> <20260410151746.61150-11-kalyazin@amazon.com>
 <aeemS2wm38Cm4qAf@google.com>
In-Reply-To: <aeemS2wm38Cm4qAf@google.com>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 21 Apr 2026 10:08:48 -0700
X-Gm-Features: AQROBzBifkAsQzS0X3Z1RL6hHFJu96bsJJpCRfOrgFmfYjKrDR-uZJ-l8nIAe34
Message-ID: <CAPTztWb67XZvfcMVnbegDNNW0LJa9UsaTGx3M898xJUJrekk0w@mail.gmail.com>
Subject: Re: [PATCH v12 10/16] KVM: guest_memfd: Add flag to remove from
 direct map
To: Sean Christopherson <seanjc@google.com>
Cc: Nikita Kalyazin <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "ackerleytng@google.com" <ackerleytng@google.com>, "yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, "prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com" <urezki@gmail.com>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>, "pavel@kernel.org" <pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, Jack Thomson <jackabt@amazon.co.uk>, Takahiro Itazuri <itazur@amazon.co.uk>, Derek Manwaring <derekmn@amazon.com>, Nikita Kalyazin <nikita.kalyazin@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_100903_526407_F201C4FA 
X-CRM114-Status: GOOD (  34.80  )
X-Mailman-Approved-At: Tue, 21 Apr 2026 14:00:45 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBcHIgMjEsIDIwMjYgYXQgOTozMeKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDEwLCAyMDI2LCBOaWtpdGEg
S2FseWF6aW4gd3JvdGU6Cj4gPiBGcm9tOiBQYXRyaWNrIFJveSA8cGF0cmljay5yb3lAbGludXgu
ZGV2Pgo+ID4KPiA+IEFkZCBHVUVTVF9NRU1GRF9GTEFHX05PX0RJUkVDVF9NQVAgZmxhZyBmb3Ig
S1ZNX0NSRUFURV9HVUVTVF9NRU1GRCgpCj4gPiBpb2N0bC4gV2hlbiBzZXQsIGd1ZXN0X21lbWZk
IGZvbGlvcyB3aWxsIGJlIHJlbW92ZWQgZnJvbSB0aGUgZGlyZWN0IG1hcAo+ID4gYWZ0ZXIgcHJl
cGFyYXRpb24sIHdpdGggZGlyZWN0IG1hcCBlbnRyaWVzIG9ubHkgcmVzdG9yZWQgd2hlbiB0aGUg
Zm9saW9zCj4gPiBhcmUgZnJlZWQuCj4gPgo+ID4gVG8gZW5zdXJlIHRoZXNlIGZvbGlvcyBkbyBu
b3QgZW5kIHVwIGluIHBsYWNlcyB3aGVyZSB0aGUga2VybmVsIGNhbm5vdAo+ID4gZGVhbCB3aXRo
IHRoZW0sIHNldCBBU19OT19ESVJFQ1RfTUFQIG9uIHRoZSBndWVzdF9tZW1mZCdzIHN0cnVjdAo+
ID4gYWRkcmVzc19zcGFjZSBpZiBHVUVTVF9NRU1GRF9GTEFHX05PX0RJUkVDVF9NQVAgaXMgcmVx
dWVzdGVkLgo+ID4KPiA+IE5vdGUgdGhhdCB0aGlzIGZsYWcgY2F1c2VzIHJlbW92YWwgb2YgZGly
ZWN0IG1hcCBlbnRyaWVzIGZvciBhbGwKPiA+IGd1ZXN0X21lbWZkIGZvbGlvcyBpbmRlcGVuZGVu
dCBvZiB3aGV0aGVyIHRoZXkgYXJlICJzaGFyZWQiIG9yICJwcml2YXRlIgo+ID4gKGFsdGhvdWdo
IGN1cnJlbnQgZ3Vlc3RfbWVtZmQgb25seSBzdXBwb3J0cyBlaXRoZXIgYWxsIGZvbGlvcyBpbiB0
aGUKPiA+ICJzaGFyZWQiIHN0YXRlLCBvciBhbGwgZm9saW9zIGluIHRoZSAicHJpdmF0ZSIgc3Rh
dGUgaWYKPiA+IEdVRVNUX01FTUZEX0ZMQUdfTU1BUCBpcyBub3Qgc2V0KS4gVGhlIHVzZWNhc2Ug
Zm9yIHJlbW92aW5nIGRpcmVjdCBtYXAKPiA+IGVudHJpZXMgb2YgYWxzbyB0aGUgc2hhcmVkIHBh
cnRzIG9mIGd1ZXN0X21lbWZkIGFyZSBhIHNwZWNpYWwgdHlwZSBvZgo+ID4gbm9uLUNvQ28gVk0g
d2hlcmUsIGhvc3QgdXNlcnNwYWNlIGlzIHRydXN0ZWQgdG8gaGF2ZSBhY2Nlc3MgdG8gYWxsIG9m
Cj4gPiBndWVzdCBtZW1vcnksIGJ1dCB3aGVyZSBTcGVjdHJlLXN0eWxlIHRyYW5zaWVudCBleGVj
dXRpb24gYXR0YWNrcwo+ID4gdGhyb3VnaCB0aGUgaG9zdCBrZXJuZWwncyBkaXJlY3QgbWFwIHNo
b3VsZCBzdGlsbCBiZSBtaXRpZ2F0ZWQuICBJbiB0aGlzCj4gPiBzZXR1cCwgS1ZNIHJldGFpbnMg
YWNjZXNzIHRvIGd1ZXN0IG1lbW9yeSB2aWEgdXNlcnNwYWNlIG1hcHBpbmdzIG9mCj4gPiBndWVz
dF9tZW1mZCwgd2hpY2ggYXJlIHJlZmxlY3RlZCBiYWNrIGludG8gS1ZNJ3MgbWVtc2xvdHMgdmlh
Cj4gPiB1c2Vyc3BhY2VfYWRkci4gVGhpcyBpcyBuZWVkZWQgZm9yIHRoaW5ncyBsaWtlIE1NSU8g
ZW11bGF0aW9uIG9uIHg4Nl82NAo+ID4gdG8gd29yay4KPiA+Cj4gPiBEaXJlY3QgbWFwIGVudHJp
ZXMgYXJlIHphcHBlZCByaWdodCBiZWZvcmUgZ3Vlc3Qgb3IgdXNlcnNwYWNlIG1hcHBpbmdzCj4g
PiBvZiBnbWVtIGZvbGlvcyBhcmUgc2V0IHVwLCBlLmcuIGluIGt2bV9nbWVtX2ZhdWx0X3VzZXJf
bWFwcGluZygpIG9yCj4gPiBrdm1fZ21lbV9nZXRfcGZuKCkgW2NhbGxlZCBmcm9tIHRoZSBLVk0g
TU1VIGNvZGVdLgo+Cj4gLi4uCj4KPiA+ICsjZGVmaW5lIEtWTV9HTUVNX0ZPTElPX05PX0RJUkVD
VF9NQVAgQklUKDApCj4gPiArCj4gPiArc3RhdGljIGJvb2wga3ZtX2dtZW1fZm9saW9fbm9fZGly
ZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+ID4gK3sKPiA+ICsgICAgIHJldHVybiAoKHU2
NClmb2xpby0+cHJpdmF0ZSkgJiBLVk1fR01FTV9GT0xJT19OT19ESVJFQ1RfTUFQOwo+ID4gK30K
PiA+ICsKPiA+ICtzdGF0aWMgaW50IGt2bV9nbWVtX2ZvbGlvX3phcF9kaXJlY3RfbWFwKHN0cnVj
dCBmb2xpbyAqZm9saW8pCj4gPiArewo+ID4gKyAgICAgaW50IHIgPSAwOwo+ID4gKwo+ID4gKyAg
ICAgVk1fV0FSTl9PTl9GT0xJTyghZm9saW9fdGVzdF9sb2NrZWQoZm9saW8pLCBmb2xpbyk7Cj4g
PiArCj4gPiArICAgICBpZiAoV0FSTl9PTl9PTkNFKCEoR01FTV9JKGZvbGlvX2lub2RlKGZvbGlv
KSktPmZsYWdzICYgR1VFU1RfTUVNRkRfRkxBR19OT19ESVJFQ1RfTUFQKSkpCj4gPiArICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKyAgICAgaWYgKGt2bV9nbWVtX2ZvbGlv
X25vX2RpcmVjdF9tYXAoZm9saW8pKQo+ID4gKyAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICsK
PiA+ICsgICAgIHIgPSBmb2xpb196YXBfZGlyZWN0X21hcChmb2xpbyk7Cj4gPiArICAgICBpZiAo
IXIpCj4gPiArICAgICAgICAgICAgIGZvbGlvLT5wcml2YXRlID0gKHZvaWQgKikoKHU2NClmb2xp
by0+cHJpdmF0ZSB8IEtWTV9HTUVNX0ZPTElPX05PX0RJUkVDVF9NQVApOwo+ID4gKwo+ID4gK291
dDoKPiA+ICsgICAgIHJldHVybiByOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBrdm1f
Z21lbV9mb2xpb19yZXN0b3JlX2RpcmVjdF9tYXAoc3RydWN0IGZvbGlvICpmb2xpbykKPiA+ICt7
Cj4gPiArICAgICBmb2xpb19yZXN0b3JlX2RpcmVjdF9tYXAoZm9saW8pOwo+ID4gKyAgICAgZm9s
aW8tPnByaXZhdGUgPSAodm9pZCAqKSgodTY0KWZvbGlvLT5wcml2YXRlICYgfktWTV9HTUVNX0ZP
TElPX05PX0RJUkVDVF9NQVApOwo+ID4gK30KPgo+IE1ha2luZyBndWVzdF9tZW1mZCByZXNwb25z
aWJsZSBmb3IgemFwcGluZyBhbmQgcmVzdG9yaW5nIHRoZSBkaXJlY3QgbWFwIG9uIGEgcGVyLQo+
IGZvbGlvIGJhc2lzIGZlZWxzIHdyb25nIGdpdmVuIHRoZSBhZGRpdGlvbiBvZiBBU19OT19ESVJF
Q1RfTUFQLiAgSSBlc3BlY2lhbGx5IGRvbid0Cj4gbGlrZSB0aGF0IHRoZSAicnVsZXMiIGZvciB3
aGVuIGFuIEFTX05PX0RJUkVDVF9NQVAgZm9saW8gaGFzIGEgZGlyZWN0IG1hcCB3aWxsIHZhcnkK
PiBiYXNlZCBvbiB0aGUgb3duZXIsIGFuZCBldmVuIHdpdGhpbiBhbiBvd25lciAoZS5nLiBndWVz
dF9tZW1mZCkgd2lsbCBiZSBhZCBob2MuCj4KPiBFLmcuIGFzIHBlciB0aGUgc2VyaWVzIHRvIGFk
ZCBndWVzdF9tZW1mZCB3cml0ZSgpIHN1cHBvcnRbKl06Cj4KPiAgIFdoZW4gZGlyZWN0IG1hcCBy
ZW1vdmFsIGlzIGltcGxlbWVudGVkIFsyXQo+ICAgIC0gd3JpdGUoKSB3aWxsIG5vdCBiZSBhbGxv
d2VkIHRvIGFjY2VzcyBwYWdlcyB0aGF0IGhhdmUgYWxyZWFkeQo+ICAgICAgYmVlbiByZW1vdmVk
IGZyb20gZGlyZWN0IG1hcAo+ICAgIC0gb24gY29tcGxldGlvbiwgd3JpdGUoKSB3aWxsIHJlbW92
ZSB0aGUgcG9wdWxhdGVkIHBhZ2VzIGZyb20KPiAgICAgIGRpcmVjdCBtYXAKPgo+IFRoYXQncyBw
cmV0dHkgZ3Jvc3MgQUJJLCBiZWNhdXNlIHdpdGggS1ZNX0dNRU1fRk9MSU9fTk9fRElSRUNUX01B
UCwgdXNlcnNwYWNlIGNhbgo+IHdyaXRlKCkgZXhhY3RseSBvbmNlLiAgVG8gcmUtd3JpdGUgbWVt
b3J5LCBJIGFzc3VtZSB1c2Vyc3BhY2Ugd291bGQgbmVlZCB0byBkbyBhCj4gUFVOQ0hfSE9MRSBv
ciB0cnVuY2F0ZS4KPgo+IFdoYXQncyBwcmV2ZW50aW5nIHVzIGZyb20gaGFuZGxpbmcgdGhpcyBh
dXRvbWFnaWNhbGx5IGluIGUuZy4gZmlsZW1hcF9hZGRfZm9saW8oKQo+IGFuZCBmaWxlbWFwX3Jl
bW92ZV9mb2xpbygpPyAgVGhlbiB0aGUgdXNhZ2UgcnVsZXMgYXJlIHByZXR0eSBzdHJhaWdodGZv
cndhcmQ6IHRoZQo+IGtlcm5lbCBtdXN0ICphbHdheXMqIGFzc3VtZSB0aGUgZGlyZWN0IG1hcCBp
cyBpbnZhbGlkIGZvciBmb2xpb3MgZnJvbQo+IEFTX05PX0RJUkVDVF9NQVAgbWFwcGluZ3MuCj4K
PiBUaGVuIGlmIEtWTSBuZWVkcyB0byB1dGlsaXplIGEga2VybmVsIG1hcHBpbmcsIGUuZy4gaW4g
a3ZtX2dtZW1fcG9wdWxhdGUoKSwgS1ZNCj4gY291bGQgdXNlIGRlZGljYXRlZCB2YXJpYW50cyBv
ZiBrbWFwX2xvY2FsX3h4eCgpIHRvIGRlYWwgd2l0aCBhIGxvY2FsIG1hcHBpbmcgZm9yCj4gYSBm
b2xpby9wYWdlIHdpdGhvdXQgYSBkaXJlY3QgbWFwLiAgT3IsIEtWTSBjb3VsZCBzaW1wbHkgZGlz
YWxsb3cgdGhlIHNwZWNpZmljCj4gc2VxdWVuY2UgdGhhdCB3b3VsZCByZXF1aXJlIEtWTSB0byBk
byB0aGUgbWVtY3B5IChJJ20gcHJldHR5IHN1cmUgd2UgY2FuIGRvIHRoYXQKPiB3aXRoIGluLXBs
YWNlIHNoYXJlZD0+cHJpdmF0ZSBjb252ZXJzaW9uIHN1cHBvcnQpLgo+Cj4gSSByZWFsaXplIHRo
YXQgY291bGQgdGhyb3cgYSBiaWcgd3JlbmNoIGludG8gd3JpdGUoKSBwZXJmb3JtYW5jZSwgYnV0
IElNTywgYmVmb3JlCj4gbWVyZ2luZyBlaXRoZXIgc2VyaWVzLCB3ZSBuZWVkIGEgY29tcGxldGUg
c3RvcnkgZm9yIGV4YWN0bHkgaG93IHRoaXMgd2lsbCBhbGwgZml0Cj4gdG9nZXRoZXIsIGluIGEg
bWFpbnRhaW5hYmxlIGZhc2hpb24gYW5kIHdpdGggc2FuZSBBQkkuCj4KPiBbKl0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMTE0MTUxODI4Ljk4MTY1LTEta2FseWF6aW5AYW1hem9u
LmNvbQo+CgpJIGFncmVlIHdpdGggdGhpcyAtIHRoaXMgYXBwcm9hY2ggd291bGQgYWxzbyBhbGxv
dyBmb3IgbWVtb3J5IHRoYXQgd2FzCm5ldmVyIGluIHRoZSBkaXJlY3QgbWFwIHRvIGJlZ2luIHdp
dGgsIG9yIGhhcyBiZWVuIHRha2VuIG91dCBhbHJlYWR5Cihmb3Igd2hpY2ggSSBoYXBwZW4gdG8g
aGF2ZSBhIHVzZSBjYXNlIDotKSkuIGd1ZXN0X21lbWZkIGFuZCBvdGhlcgpjb2RlIGNhbiB0aGVu
IGFzc3VtZSB0aGF0IEFTX05PX0RJUkVDVF9NQVAgbWVhbnMgdGhleSBoYXZlIHRvIHRha2UKZXhw
bGljaXQgYWN0aW9uIHRvIG1hcCBpdCBpZiBuZWVkZWQuIEl0J3MgYSBjbGVhbiwgc2ltcGxlIEFC
SS4KCldpdGggdGhlIGN1cnJlbnQgc2V0IG9mIHBhdGNoZXMsIGl0IHNlZW1zIGxpa2UgdGhpcyBj
b3VsZG4ndCBiZSBkb25lCmluIGEgY2xlYW4gbWFubmVyLgoKLSBGcmFuawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
