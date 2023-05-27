Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE95C77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 27 May 2023 02:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRGlUaof25cKkUhW3pfZ6WTptLoyiTqes4g759Ipy0o=; b=gQjPShGtqDH1iF
	bFK34pjTciR4FdXIiQHqKP3pxEv1gPEUXxSIHqmM8EAtoODpuHjwxdjJ5iCjoEnt1Gsne62Ntv0Ro
	giPNix+RR+T/e5wtiyva86dItFGZBF4QJPNcgvwsAmjYOxWzzvz32N2vKWqBVWGZ/MTpY9XXyyAFO
	BriPT/mM3miOM04YTjMV7qJaHO8HKXJ7lw4KvP2HCP0I/gesVABXRHtKGjextMmka2oHuVDPKwPPv
	76xEyr0Ue5mAu8nMObjJ4KzPrhqWa9Wt9ILOrcPqGIvUdzaty5ARmBQLYIERVLraqFBBuMaI7vZ37
	AnvQ9VvswsHaO5URr9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2jeE-004ePe-16;
	Sat, 27 May 2023 02:27:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2jeA-004eN3-27;
	Sat, 27 May 2023 02:27:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b00ecabdf2so13583365ad.2;
        Fri, 26 May 2023 19:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685154421; x=1687746421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGd3VhznQ2I/NQDk+4roFWXHVSOBmaxtJ+oHTP+UbGk=;
        b=n7sDEKh6jt4tjfPVQPZjuftdEuC76pajkpfPSZEdFb7ieTmVQ5SpkxQNB5yMcm06QN
         isB+1LbRGBHRIUuoBTXYa6Y702+fLmeOCqWjOutS3GZWlk7ZHJbef/Kcn2GDtcXt7Di5
         B0F10QB32YuiJwlAvNLeESVDkmplddaavJBcbyNa2aP2XC3bQ0hI5yR8F/Yxwe5RODhi
         Wb72xgb9IQXkByEhjLGwZbvv1kua9AC/H/Pkq96DLHrfA9rxhbQVjVHhbgkQ1B/bXkAB
         aHgoCQgsq+/XaBn2ddmY+9Iwi18VcA5IRBqMr6/eWKC+vitweWJ0fDlo+tr2j1vcbrHE
         eJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685154421; x=1687746421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGd3VhznQ2I/NQDk+4roFWXHVSOBmaxtJ+oHTP+UbGk=;
        b=D2peCBUiBMNK48j9SOOgbBgi7I0nyvxmIUpgDmneEb6Zwx4lI74Y2LDG91Bz9UI923
         FHHtdfMS8tQhPLC2jWCZ9kb4cwKI2yNvA/hOi/YIZ9QFwCVfmJ6+bEVEsnTIBSg5/qfF
         Sp1j0cThCh2DOnq9rSZvUEtTlFAtuwCtYg7MKeJw8e+PIdFY5w+JvfOzI6XDsNuP4JUv
         sXyd9PLN03hS7Y+Yb/m9qERIb0dYE8UkPTvFK5O9a8sF7jmSAdKIvDk8zDDywiAi6P88
         SCykv/Jk0cEy5OXPse/HvcWyfTsh4pT+UvHABv9uhNrE5OnyPvdOBr0QkaaSTsUPY2Ov
         Ki8w==
X-Gm-Message-State: AC+VfDy3G82AKNclUUu6kG4krKucq8DHAX2xgsEQcrplWmfTl5AhNEBC
	BLBwcMD7HQCnmvjkF1j/gzqDzzzFVwIMoOkxYh1Z5NvIQYY=
X-Google-Smtp-Source: ACHHUZ6aAeSR4JF6rBXm5cC75wX5zCQJnq/3rFEcZQpE51VFfD85Rkd+KHCNiQAQXbtR9I84BTrFBx+V7cy+Ct2ere0=
X-Received: by 2002:a17:903:2345:b0:1af:f4f5:6fae with SMTP id
 c5-20020a170903234500b001aff4f56faemr5778765plh.54.1685154421346; Fri, 26 May
 2023 19:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684999824.git.haibo1.xu@intel.com> <26dea518fc5e8da51e61db279d175364bfecd009.1684999824.git.haibo1.xu@intel.com>
 <20230525-705ddcbcd43aa63e3fd356c8@orel> <CAJve8onF9MFuaVsThFnhjWr6ZomB0Lhr9WXGvMiJDt5vrjeKLg@mail.gmail.com>
 <20230526-d8d768a23cd6bdc274bc165c@orel>
In-Reply-To: <20230526-d8d768a23cd6bdc274bc165c@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sat, 27 May 2023 10:26:51 +0800
Message-ID: <CAJve8on=5NtnzR=iAQs2D4B2Ly=KFXF-0ZDtkXFuz-SdxTGGmA@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] KVM: riscv: selftests: Make check_supported arch specific
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_192710_698495_9FAF22B5 
X-CRM114-Status: GOOD (  31.26  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgNDo0NOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMDM6NTA6
MzJQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBPbiBGcmksIE1heSAyNiwgMjAyMyBhdCAx
Mjo0MOKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiBPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCAwMzozODozM1BNICswODAwLCBIYWli
byBYdSB3cm90ZToKPiA+ID4gPiBjaGVja19zdXBwb3J0ZWQoKSB3YXMgdXNlZCB0byB2ZXJpZnkg
d2hldGhlciBhIGZlYXR1cmUvZXh0ZW5zaW9uIHdhcwo+ID4gPiA+IHN1cHBvcnRlZCBpbiBhIGd1
ZXN0IGluIHRoZSBnZXQtcmVnLWxpc3QgdGVzdC4gQ3VycmVudGx5IHRoaXMgaW5mbwo+ID4gPiA+
IGNhbiBiZSByZXRyaWV2ZWQgdGhyb3VnaCB0aGUgS1ZNX0NBUF9BUk1fKiBBUEkgaW4gYWFyY2g2
NCwgYnV0IGluCj4gPiA+ID4gcmlzY3YsIHRoaXMgaW5mbyB3YXMgb25seSBleHBvc2VkIHRocm91
Z2ggdGhlIEtWTV9HRVRfT05FX1JFRyBvbgo+ID4gPiA+IEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCBw
c2V1ZG8gcmVnaXN0ZXJzLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gWHUg
PGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYyB8IDMyICsrKysrKysrKysrLS0tLS0tLS0tLS0K
PiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygt
KQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxp
c3QuYwo+ID4gPiA+IGluZGV4IGY2YWQ3OTkxYTgxMi4uZjFmYzExM2U5NzE5IDEwMDY0NAo+ID4g
PiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4g
PiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4g
PiA+IEBAIC05OSw2ICs5OSwyMCBAQCB2b2lkIF9fd2VhayBwcmludF9yZWcoY29uc3QgY2hhciAq
cHJlZml4LCBfX3U2NCBpZCkKPiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gICNpZmRlZiBfX2Fh
cmNoNjRfXwo+ID4gPiA+ICtzdGF0aWMgdm9pZCBjaGVja19zdXBwb3J0ZWQoc3RydWN0IHZjcHVf
cmVnX2xpc3QgKmMpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICBzdHJ1Y3QgdmNwdV9yZWdfc3Vi
bGlzdCAqczsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgZm9yX2VhY2hfc3VibGlzdChjLCBzKSB7
Cj4gPiA+ID4gKyAgICAgICAgICAgICBpZiAoIXMtPmNhcGFiaWxpdHkpCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPgo+ID4gPiBJIHdhcyBnb2luZyB0byBzYXkg
dGhhdCBtYWtpbmcgdGhpcyBmdW5jdGlvbiBhYXJjaDY0IHNob3VsZG4ndCBiZQo+ID4gPiBuZWNl
c3NhcnksIHNpbmNlIHJpc2N2IGxlYXZlcyBjYXBhYmlsaXR5IHNldCB0byB6ZXJvIGFuZCB0aGlz
IGZ1bmN0aW9uCj4gPiA+IGRvZXNuJ3QgZG8gYW55dGhpbmcsIGJ1dCB0aGVuIGxvb2tpbmcgYWhl
YWQgSSBzZWUgcmlzY3YgaXMgYWJ1c2luZwo+ID4gPiBjYXBhYmlsaXR5IGJ5IHB1dHRpbmcgaXNh
IGV4dGVuc2lvbnMgaW4gaXQuIElNTywgY2FwYWJpbGl0eSBzaG91bGQKPiA+ID4gb25seSBiZSBz
ZXQgdG8gS1ZNX0NBUF8qIHZhbHVlcy4gU2luY2UgcmlzY3YgZG9lc24ndCB1c2UgaXQsIHRoZW4g
aXQKPiA+ID4gc2hvdWxkIGJlIGxlZnQgemVyby4KPiA+ID4KPiA+ID4gSWYgd2UncmUgZ29pbmcg
dG8gYWJ1c2Ugc29tZXRoaW5nLCB0aGVuIEknZCByYXRoZXIgYWJ1c2UgdGhlICdmZWF0dXJlJwo+
ID4gPiBtZW1iZXIsIGJ1dCBzaW5jZSBpdCdzIG9ubHkgYW4gaW50IChub3QgYW4gdW5zaWduZWQg
bG9uZyksIHRoZW4gbGV0J3MKPiA+ID4ganVzdCBhZGQgYW4gJ3Vuc2lnbmVkIGxvbmcgZXh0ZW5z
aW9uJyBtZW1iZXIuCj4gPiA+Cj4gPgo+ID4gR29vZCBpZGVhIQo+ID4KPiA+IEZvciB0aGUgbmV3
ICdleHRlbnNpb24nIG1lbWJlciBpbiByaXNjdiwgSSB0aGluayBpdHMgdXNlIGNhc2Ugc2hvdWxk
IGJlCj4gPiBpZGVudGljYWwgdG8gdGhlICdmZWF0dXJlJyBtZW1iZXIgaW4gYWFyY2g2NChLVk1f
UklTQ1ZfSVNBX0VYVF9GCj4gPiB3YXMgc2ltaWxhciB0byBLVk1fQVJNX1ZDUFVfU1ZFKT8gSWYg
c28sIEkgdGhpbmsgd2UgY2FuIGp1c3QgcmV1c2UKPiA+IHRoZSAnZmVhdHVyZScgbWVtYmVyIHNp
bmNlIHRoZSBkYXRhIHR5cGUgd2FzIG5vdCBhIGJpZyBkZWFsLgo+Cj4gWW91J3JlIHJpZ2h0LiBB
biBpbnQgaXMgZmluZSBmb3IgdGhlIGlzYSBleHRlbnNpb24gaW5kZXgsIHdoaWNoIGlzIGFsbCB3
ZQo+IG5lZWQgdG8gcmVwcmVzZW50Lgo+Cj4gVGhhbmtzLAo+IGRyZXcKClRoYW5rcyBmb3IgdGhl
IHN1Z2dlc3Rpb24hIEkgd2lsbCBpbmNsdWRlIHRoZSBjaGFuZ2UgaW4gdjMgc29vbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
