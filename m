Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829F0C79F99
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjyR7vMIf7KtyR6XaN4DlV+wwlZoOm/uukI56cweW0M=; b=viVG84EyhRLSoH
	I4ko+E6zw+l+pWsL9+bpkcQjPiw5gTMzKaZF7rZsuwpckRXkAYeIcJWovIPFD8x6dBrzmEyByS+gh
	XtlgZzHw4TDrFWY38TMar2S9TCjQLAdckxJCauETK2gFq+SrJg75PblrhJxUca9PLe1xYrFBumDqN
	ss73roMszJpXLk6M05DIDL96hsAdNjE4hqXd3Hdi5iabyZJM2FsO6yMP7sk2nSK5vOaX9IdkFLY9b
	jmEbp+bMWoJQY75miPShEQZ7pR4g6z2HNcjHO2Fy+aHq4nA3imcifsn5NoaLkHLy1eeYyXRQO9R+P
	1NDXy//W40/hMV1t3IzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cbe-00000007Ph0-07WA;
	Mon, 07 Sep 2026 16:54:06 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cbZ-00000007Pej-0ay2
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 16:54:03 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-530411c7ee1so368611cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 09:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788800036; cv=none;
        d=google.com; s=arc-20260327;
        b=QkPjwhDnrO5Uum6rZb1L4KWDT9Fvjm9mLfG2TodFoTXzaVbT603sxAdGhcDDsWXamP
         gN25YUF3kEo6RCzpvNm7N6JBOmIe1kRM1eha42xLpkv416a3XnQulGRXl8MyKpF64Igl
         SksgXQMd4eBXoWBAknAlqZPopNYjVvc/wsHqDWyBvcosdEhIp5dA5w11eSoHstnOc7Uu
         X6LyfbeHt1AcgMqCReTDVDVxxBTyZt4B63F/jliba7n2fSucErd+/Q6TKEwhpIjO3YGX
         DFnYxhAlduzrulsO8ePpgUxMyILWtFnHwOaLwLNdhrVM+Bi6gX/xRgBGoZwgTubU55pz
         WuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WOgo3zFXzbtiQDjz57z5HXaLiQwAncd9HG4Gw1Bp/lg=;
        fh=wLljdDK5TSoaeSuqNu9BDRhJ8Ym38f6l0vCyVLMdjfE=;
        b=Y5lwOD3shoLh0rQoeMVmQ52en1dnbs2ecuzAzXJ9X+IZx/ZSf0kSVb7VBFfz/spNUg
         UbXQxl/N1v/GSkQ3RfRywBa/MNJIvJX2rRk9CknOoffCxnu5/tQS914SKuRJj9PO/flM
         9b9JCvbz4r1KRXLEFgGorKdvC3qQPIirc6BMb5XTY4hh6SbbYSaMx0t4n6z8u79Q7gf+
         CdeQ1vcBKPrWOqHEiQ3laMwB5/L9XEMdATu3AtkJgQx5BdaFRVWgpGozH/4n0ja3rWEg
         FfybJbFgMc0djeSHSjbwXhgkHNc9Ec1JTWvSEPbJ9yjFM1o1gxbkjhtXYUo8VMMgSkYt
         OY7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788800036; x=1789404836; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOgo3zFXzbtiQDjz57z5HXaLiQwAncd9HG4Gw1Bp/lg=;
        b=LYymi73UhgbSYoM2au7j/fs0QQeZcu6SP4+iqdilIM/lu6uzLsBiwJurS8jbeW5zPO
         d+egXZ/2SBKJvvzT8ruU9VPIXzxPzwjDKLz7dPz1QNyPyvmyyc/AcwoHnyjZ8XrOsLAP
         m+XOgER7q7kH2Fps0jjiN36yEghXbvxdWlvphEmhvPbSJVh95BvTzJcjB3KtJVxrX+WE
         Ua9pf3em89Tzk8cxbpgRhxTNih3CP3QLyERwDb9weCt0LhQorIseDYaFoSOmZJHHZURV
         GbRQikDx8r8s3zPyzw3PELt4gPS7ArlYNygt5lXCVqcf1TokJHF034a9nR71oKDX+U2B
         jqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788800036; x=1789404836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOgo3zFXzbtiQDjz57z5HXaLiQwAncd9HG4Gw1Bp/lg=;
        b=UneuWB9QGfJZLgFOwPhs+OyIK2/ToUyrfYrVpXlYl/PXWXbzyphrmvAZsBeNy+ZHmF
         P+nPoymP7h1F5Prx64UQteEZjXj994yqwDCMBPrOvlET2ClGENK0WC6XaolNmtPipfZS
         JX2YkeIKxkuIhMbOFpQixtqJg1sWPkQ9uypArNuCNxzqc66S0vx83LkNbtm7gyykAVtj
         F9mevynah2Att2k9QrxsqR+T/j9XyYd/NervxPciYgfMeGRhuFLfjdhGUGopuW5i+PRE
         6cZpHJWkovYa+r9aQ4MguTQ3RfStNhwWrxR+5SWuN/RiHjIhbgGv5zg0OZfxeJ58LqrM
         3d0A==
X-Forwarded-Encrypted: i=1; AKwUvBxwb7z773vpG2vmu8p9S+Ocz39eVK/bGTfhcS9Gm0+7p/VhpvCDVjQvlg+VwemEHyqxwlGw5chXZtENfQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kcUZwthl2wxclDZN3/t9GKcLnl6f3fGcF9HzxalilwmbZGjV3/
	JdqwX7U7HOgqzezBsCx7oafpkRHHtNbHiwCHv+qlyzilse72QdUQSIFN/sL89To6oOZkk/vYYfP
	hqXLzQsosOQNAa/CfjDOa1WcEwQL7T8fu+r+dO2/d
X-Gm-Gg: AYBFou1Mmp44vCKEr/r7xMKp2csotgYyDVEfitDba/nFukT/PtjOTWk35RkEfyE/omV
	3PUHGf2OpXbI7KjflLljUgyIwjpZ+xSqJfhzod4oIoXvNYUsHKF/yUkRO5Jt2A/Byfq4KH6Xo+0
	NgF4RzSwh3PQfJIrx5gc+Rz6eyXeozUXeQzfCM/BDUY6j9cv+nyoHZ3U+zx7NLB+WtDp/wJ8l9J
	fic8ygg59LB0xQSP2EPvVafOGzS/YJXrZDOh9SUevr3pcPWIHtyUvDxcP9Cu2AtzHvJXb2K82Os
	y1A4/lTjbrTKfJQK4OwDZXj74S/8OHvggjpNoSybofU=
X-Received: by 2002:a05:622a:28e:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-530920caba6mr3560401cf.0.1788800035234; Mon, 07 Sep 2026
 09:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-12-5456a81c8212@kernel.org>
 <apbUpMDJglS99_yK@thinkstation> <apbfzUwBQyxe3P9R@gremlin>
 <apcH74QsR5I-DIbL@thinkstation> <apcJhtvnd45EkjJI@gremlin>
In-Reply-To: <apcJhtvnd45EkjJI@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 7 Sep 2026 09:53:43 -0700
X-Gm-Features: AcwNN1WRGdFWOzxEbOcmfkztqDuQQAGpor7Xm60pdWlD2DjKNo1Y7S4S7DNXdgs
Message-ID: <CAJuCfpH_v4YU+hsQDU_yQ4HZDf-2C6DuiJU5PGL+uVAsTwkZug@mail.gmail.com>
Subject: Re: [PATCH 12/12] mm: change the contract for free_pgtables(), update docs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Simon Schuster <schuster.simon@siemens-energy.com>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_095401_196846_CD0B6EAA 
X-CRM114-Status: GOOD (  31.83  )
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

T24gVHVlLCBTZXAgMSwgMjAyNiBhdCAxMDoyNeKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMDEsIDIwMjYgYXQgMDY6MTU6
MTdQTSArMDEwMCwgS2lyeWwgU2h1dHNlbWF1IHdyb3RlOgo+ID4gT24gVHVlLCBTZXAgMDEsIDIw
MjYgYXQgMDM6MzE6MjZQTSArMDEwMCwgTG9yZW56byBTdG9ha2VzIChBUk0pIHdyb3RlOgo+ID4g
PiBPbiBUdWUsIFNlcCAwMSwgMjAyNiBhdCAwMjo1NzoxM1BNICswMTAwLCBLaXJ5bCBTaHV0c2Vt
YXUgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBTZXAgMDEsIDIwMjYgYXQgMTI6MDE6MzJQTSArMDEw
MCwgTG9yZW56byBTdG9ha2VzIChBUk0pIHdyb3RlOgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL21t
L3BndGFibGUtZ2VuZXJpYy5jIGIvbW0vcGd0YWJsZS1nZW5lcmljLmMKPiA+ID4gPiA+IGluZGV4
IGI5MWIxYTk4MDI5Yy4uZmY4ZmYzNzA2NDg1IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvbW0vcGd0
YWJsZS1nZW5lcmljLmMKPiA+ID4gPiA+ICsrKyBiL21tL3BndGFibGUtZ2VuZXJpYy5jCj4gPiA+
ID4gPiBAQCAtMzg2LDkgKzM4NiwyMSBAQCBwdGVfdCAqcHRlX29mZnNldF9tYXBfcndfbm9sb2Nr
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwbWRfdCAqcG1kLAo+ID4gPiA+ID4gICAqIGJlIHJlYWQt
b25seS9yZWFkLXdyaXRlIHByb3RlY3RlZC4KPiA+ID4gPiA+ICAgKgo+ID4gPiA+ID4gICAqIE5v
dGUgdGhhdCBmcmVlX3BndGFibGVzKCksIHVzZWQgYWZ0ZXIgdW5tYXBwaW5nIGRldGFjaGVkIHZt
YXMsIG9yIHdoZW4KPiA+ID4gPiA+IC0gKiBleGl0aW5nIHRoZSB3aG9sZSBtbSwgZG9lcyBub3Qg
dGFrZSBwYWdlIHRhYmxlIGxvY2sgYmVmb3JlIGZyZWVpbmcgYSBwYWdlCj4gPiA+ID4gPiAtICog
dGFibGUsIGFuZCBtYXkgbm90IHVzZSBSQ1UgYXQgYWxsOiAib3V0c2lkZXJzIiBsaWtlIGtodWdl
cGFnZWQgc2hvdWxkIGF2b2lkCj4gPiA+ID4gPiAtICogcHRlX29mZnNldF9tYXAoKSBhbmQgY28g
b25jZSB0aGUgdm1hIGlzIGRldGFjaGVkIGZyb20gbW0gb3IgbW1fdXNlcnMgaXMgemVyby4KPiA+
ID4gPiA+ICsgKiBleGl0aW5nIHRoZSB3aG9sZSBtbSwgZG9lcyBub3QgdGFrZSB0aGUgcGFnZSB0
YWJsZSBsb2NrIGJlZm9yZSBmcmVlaW5nIGEKPiA+ID4gPiA+ICsgKiB0YWJsZS4KPiA+ID4gPiA+
ICsgKgo+ID4gPiA+ID4gKyAqIEhvd2V2ZXIsIHRoZSBQTUQgZW50cnkgaXMgY2xlYXJlZCBmaXJz
dCwgYW5kIHRoZSB0YWJsZSBmcmVlZCBvbmx5IGFmdGVyCj4gPiA+ID4gPiArICogYW4gUkNVIGdy
YWNlIHBlcmlvZCwgc28gYSB3YWxrZXIgdGhhdCBtYXBwZWQgdGhlIHRhYmxlIHVuZGVyCj4gPiA+
ID4gPiArICogcmN1X3JlYWRfbG9jaygpIHN0YXlzIHNhZmUsIGFuZCB0aGUgcG1kX3NhbWUoKSBy
ZWNoZWNrIGluCj4gPiA+ID4gPiArICogcHRlX29mZnNldF9tYXBfbG9jaygpIGRldGVjdHMgdGhl
IHRlYXJkb3duLgo+ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiArICogVGhlcmVmb3JlIGl0IGlzIHNh
ZmUgZm9yICJvdXRzaWRlcnMiIGxpa2Uga2h1Z2VwYWdlZCB0byB1c2UKPiA+ID4gPiA+ICsgKiBw
dGVfb2Zmc2V0X21hcCgpIGFuZCBjby4gZm9yIFZNQXMgdGhhdCBtaWdodCBiZSB1bmRlcmdvaW5n
IHBhZ2UgdGFibGUKPiA+ID4gPiA+ICsgKiB0ZWFyZG93bi4KPiA+ID4gPgo+ID4gPiA+IElzIGl0
IHN0cmljdGx5IHRydWU/Cj4gPiA+ID4KPiA+ID4gPiBmcmVlX3B0ZV9yYW5nZSgpIGNsZWFycyB0
aGUgcG1kIHdpdGhvdXQgdGFraW5nIHRoZSBQVEwsIHNvIHRoZQo+ID4gPiA+IHBtZF9zYW1lKCkg
cmVjaGVjayBpbiBwdGVfb2Zmc2V0X21hcF9sb2NrKCkgY2FuIHBhc3MgYW5kIHRoZSBwbWQgZ2V0
cwo+ID4gPiA+IGNsZWFyZWQgcmlnaHQgYWZ0ZXIuCj4gPiA+ID4KPiA+ID4gPiBSZWFkZXJzIGFy
ZSBmaW5lIC0tIF9fcHRlX29mZnNldF9tYXAoKSBob2xkcyByY3VfcmVhZF9sb2NrKCkgdW50aWwK
PiA+ID4gPiBwdGVfdW5tYXAoKSwgc28gdGhlIHRhYmxlIGNhbm5vdCBnbyBhd2F5Lgo+ID4gPiA+
Cj4gPiA+ID4ga2h1Z2VwYWdlZCBpcyBhbiBvZGQgZXhhbXBsZSBoZXJlLiBjb2xsYXBzZV9wdGVf
bWFwcGVkX3RocCgpIGFuZAo+ID4gPiA+IHJldHJhY3RfcGFnZV90YWJsZXMoKSBkb24ndCByZWx5
IG9uIHRoaXMgcmVjaGVjayAtLSB0aGV5IHRha2UgcG1kX2xvY2soKQo+ID4gPiA+IHBsdXMgdGhl
IHB0bCBhbmQgZG8gdGhlaXIgb3duIHBtZF9zYW1lKCkgdW5kZXIgYm90aC4KPiA+ID4gPgo+ID4g
PiA+IENhbiB3ZSBzYXkgd2Fsa3MgYXJlIHNhZmUgYW5kIGxlYXZlIHRoZSB3cml0ZSBydWxlIHdo
ZXJlIGl0IGlzPwo+ID4gPgo+ID4gPiBIbW0geWVhaCwgYWggcGFnZSB0YWJsZXMsIHdoYXQgYSBy
YWJiaXQgaG9sZSBvZiBob3Jyb3IgOikKPiA+ID4KPiA+ID4gSSBndWVzcyB0aGlzIGlzIGVmZmVj
dGl2ZWx5IGEgcmVmbGVjdGlvbiBvZiB0aGUgJ3dyaXRlIGxvY2sgb24gd3JpdGUsIFJDVSBsb2Fk
Cj4gPiA+IG9uIHJlYWQnIHBhdHRlcm4gaW4gUkNVIGl0c2VsZiBnZW5lcmFsbHkuCj4gPiA+Cj4g
PiA+IFNvLCBtYXliZSBzb21ldGhpbmcgbGlrZToKPiA+ID4KPiA+ID4gICogTm90ZSB0aGF0IGZy
ZWVfcGd0YWJsZXMoKSwgdXNlZCBhZnRlciB1bmFtcHBpbmcgZGV0YWNoZWQgdm1hcywgb3Igd2hl
bgo+ID4gPiAgKiBleGl0aW5nIHRoZSB3aG9lbCBtbSwgZG9lcyBub3QgdGFrZSBhIHBhZ2UgdGFi
bGUgbG9jayBiZWZvcmUgZnJlZWluZyBhIHBhZ2UKPiA+ID4gICogdGFibGUuCj4gPiA+ICAqCj4g
PiA+ICAqIEFzIHBhZ2UgdGFibGUgZnJlZWluZyBpdHNlbGYgaXMgUkNVLXNhZmUsIHBhZ2UgdGFi
bGUgcmVhZGVycyBjYW4gc2FmZWx5IHJ1bgo+ID4gPiAgKiBjb25jdXJyZW50bHkgd2l0aCBwYWdl
IHRhYmxlIHRlYXJkb3duLiBIb3dldmVyLCB3cml0ZXJzIGNhbm5vdCwgYXMgd2l0aG91dAo+ID4g
PiAgKiBhIGxvY2sgbm90aGluZyBwcmV2ZW50cyBjb25jdXJyZW50IHRlYXJkb3duLgo+ID4gPiAg
Ki8KPiA+ID4KPiA+ID4gSW5zdGVhZD8gV2hhdCBkbyB5b3UgdGhpbms/Cj4gPgo+ID4gcy93aG9l
bC93aG9sZS8KPgo+IEhhaGEgeXVwIHRoZSBpbmV2aXRhYmxlIHR5cG8uLi4KCkFsc28gcy91bmFt
cHBpbmcvdW5tYXBwaW5nIHBsZWFzZS4KPgo+ID4KPiA+IE90aGVyd2lzZSwgTEdUTS4KPgo+IFRo
YW5rcyEgOikKPgo+ID4KPiA+IC0tCj4gPiAgIEtpcnlsIFNodXRzZW1hdSAvIEtpcmlsbCBBLiBT
aHV0ZW1vdgo+Cj4gLS0KPiBDaGVlcnMsIExvcmVuem8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
