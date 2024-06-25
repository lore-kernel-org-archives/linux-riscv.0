Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D0EC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sabF/nF6Li52QdeCw3keuvqjwQllnP8lVYYB35GAqIw=; b=FWBriWhN4RJOCR
	zvcBVfCYu+5XnU6FQg+2t/uAKxPNoWaV1ej0LmPPaDZYt1c78bfbSZgBIglIiQhwVMgOYrwdRMKHG
	Gw6PrpiQHUPNgq3rgH4pNbOIo6Y5gs4fmPJ6yHBms67fd8tmchAI0YrZedWBXFnmmgNN/XNWVZLVG
	sZcYHxxgSgTOOoZW0vUdyH5lXLcZnMJ9/1ItTw14w+6iN8YnAFdGakNxpAnfpMbo5ZBJsUe2ssGi9
	0YbMpxFdouljCHz4ek1Ga1qAci2iPxL9XsPj8j7B9EDXR3etukU1LSKF0Q1ty7SKoVExLw4yv4ztC
	6wDjbTjY3w9iP4Ydm6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3Yx-00000002QNk-0GEw;
	Tue, 25 Jun 2024 10:38:11 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3Yt-00000002QMV-1k51
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 10:38:09 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00b97so5210723a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 03:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719311885; x=1719916685; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgACs1Zq8zO5lFcqRU3bBruH/XX+msPS49ZLh765+hU=;
        b=ECrmKptwjdtI29IiJ6PE3ykP3B8DizmrxOcWIbbvy6vWg7lyYwwLB0UCqXXryVBfMU
         CcXIlNY3npXI4dH5gIteD28Y/CRhy+xQNyD0copgItq8lY3vWHW8GXSIZ+5ZbGlSVMHQ
         VpKAcYs3uZmhlZwcwwsBlkSV+mTkT+U3q8TAYQQAhkQhiNcO/P5F7oUFGiAA/aX+Xtz8
         cZb+/Bn83w4K1pD2wfgMhfLlzHvQFo890+UwchYmsslZ8ejxuaeZSZWcqqz7ysA5ZbEE
         4wjsdCyfJBKsmzwcEg2DpK073CvJwG/9jfOP+UqJBxzTEfA3NH5mWDkZCbyqVSPfc3Ff
         yzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719311885; x=1719916685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgACs1Zq8zO5lFcqRU3bBruH/XX+msPS49ZLh765+hU=;
        b=Ct8oc23GQNyw7i8l6b9HpLXAcBu9GTxpxHNPEUMr4vij4OI9GBXr9k/CM2cKLhlNq1
         tM/K+PC3d0+gaEu1O/+x+Bb7rvoxt54su/CxH4+4BIUUs4Y7+T+iigVPXuQKHppbvDXK
         +vxJhti7boFEbXCtk43DBAYR48KZdT2XuwD8XTGMq+C6kO+0T10e7+aKcodsGTeMOW1w
         ZOjxYr3mpgFfuVxNbUOLSbMEwKOKRMqE+QglxBbG7jKD8S834QBOA+MR6df2+VtVcBOH
         EX5iwkIivyGpziXcbvRgqhubBkttyaOMBss4J5M8JrGYCm454sdWk2WkNPMUwiEpzKhZ
         iXmw==
X-Forwarded-Encrypted: i=1; AJvYcCVUZ+awIf4l+6myt8hc6DHuCkIfcvHHMzfVIiEhFyRtzbnSnXeqEsTOkB30ibvyD+USh/bjBi29GW7BR0KJuVM1Ssg6lQ56jcKxDUkOnohm
X-Gm-Message-State: AOJu0Yxl/HXtCS5nSLTHyxT2f65ez4qcyiqlhMqs3JxCZjhVETmVoZ5p
	gHF7XRo4+5GOSo0sfotqMyNNProd2I0eOf4IyR30SukiwVCEq8hg7vfDS9bET6BTWwbQIJoHaq7
	TwNI6z0F08qV1ndS8V8KFt1p7sZoZP9qBc6Ez5A==
X-Google-Smtp-Source: AGHT+IEOGwcd6y/gx12jEq+6dGlJLUlszkJPcbr1MdpHUe7LAywiaX+cvkxEPjNM34TUSpxkVh5v/jOigUd5w64NKMg=
X-Received: by 2002:a50:d716:0:b0:57c:9ccd:c626 with SMTP id
 4fb4d7f45d1cf-57d4bddfbfbmr4573117a12.39.1719311885379; Tue, 25 Jun 2024
 03:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-2-yongxuan.wang@sifive.com> <20240621-d1b77d43adacaa34337238c2@orel>
 <20240621-nutty-penknife-ca541ee5108d@wendy> <20240621-b22a7c677a8d61c26feaa75b@orel>
 <20240621-pushpin-exclude-1b4f38ae7e8d@wendy> <20240621-a69c8f97e566ebd3a82654c1@orel>
In-Reply-To: <20240621-a69c8f97e566ebd3a82654c1@orel>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 25 Jun 2024 18:37:53 +0800
Message-ID: <CAMWQL2jWPD77f2gz_N8HM+YdKev-8RvOCOUgm5-uxq-5VTvCXw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] RISC-V: Add Svade and Svadu Extensions Support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, apatel@ventanamicro.com, alex@ghiti.fr, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Jinyu Tang <tjytimi@163.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, wchen <waylingii@gmail.com>, 
	Samuel Ortiz <sameo@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Leonardo Bras <leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_033807_798042_2D05AE9D 
X-CRM114-Status: GOOD (  43.60  )
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

SGkgQ29ub3IsIEFuZHJldyBhbmQgQWxleGFuZHJlLAoKT24gRnJpLCBKdW4gMjEsIDIwMjQgYXQg
ODowNuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+
Cj4gT24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMTI6MDA6MzJQTSBHTVQsIENvbm9yIERvb2xleSB3
cm90ZToKPiA+IE9uIEZyaSwgSnVuIDIxLCAyMDI0IGF0IDEyOjQyOjMyUE0gKzAyMDAsIEFuZHJl
dyBKb25lcyB3cm90ZToKPiA+ID4gT24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMTE6MjQ6MTlBTSBH
TVQsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEp1biAyMSwgMjAyNCBhdCAx
MDo0Mzo1OEFNICswMjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gLi4uCj4gPiA+ID4gPiBJdCdz
IGhhcmQgdG8gZ3Vlc3Mgd2hhdCBpcywgb3Igd2lsbCBiZSwgbW9yZSBsaWtlbHkgdG8gYmUgdGhl
IGNvcnJlY3QKPiA+ID4gPiA+IGNob2ljZSBvZiBjYWxsIGJldHdlZW4gdGhlIF91bmxpa2VseSBh
bmQgX2xpa2VseSB2YXJpYW50cy4gQnV0LCB3aGlsZSB3ZQo+ID4gPiA+ID4gYXNzdW1lIHN2YWRl
IGlzIG1vc3QgcHJldmFsZW50IHJpZ2h0IG5vdywgaXQncyBhY3R1YWxseSBxdWl0ZSB1bmxpa2Vs
eQo+ID4gPiA+ID4gdGhhdCAnc3ZhZGUnIHdpbGwgYmUgaW4gdGhlIERULCBzaW5jZSBEVHMgaGF2
ZW4ndCBiZWVuIHB1dHRpbmcgaXQgdGhlcmUKPiA+ID4gPiA+IHlldC4gQW55d2F5LCBpdCBkb2Vz
bid0IHJlYWxseSBtYXR0ZXIgbXVjaCBhbmQgbWF5YmUgdGhlIF91bmxpa2VseSB2cy4KPiA+ID4g
PiA+IF9saWtlbHkgdmFyaWFudHMgYXJlIGJldHRlciBmb3IgZG9jdW1lbnRpbmcgZXhwZWN0YXRp
b25zIHRoYW4gZm9yCj4gPiA+ID4gPiBwZXJmb3JtYW5jZS4KPiA+ID4gPgo+ID4gPiA+IGJpbmRp
bmcgaGF0IG9mZiwgYW5kIGtlcm5lbCBoYXQgb24sIHdoYXQgZG8gd2UgYWN0dWFsbHkgZG8gaWYg
dGhlcmUncwo+ID4gPiA+IG5laXRoZXIgU3ZhZHUgb3IgU3ZhZGUgaW4gdGhlIGZpcm13YXJlJ3Mg
ZGVzY3JpcHRpb24gb2YgdGhlIGhhcmR3YXJlPwo+ID4gPiA+IERvIHdlIGp1c3QgYXJiaXRyYXJp
bHkgdHVybiBvbiBTdmFkZSwgbGlrZSB3ZSBhbHJlYWR5IGRvIGZvciBzb21lCj4gPiA+ID4gZXh0
ZW5zaW9uczoKPiA+ID4gPiAgIC8qCj4gPiA+ID4gICAgKiBUaGVzZSBvbmVzIHdlcmUgYXMgdGhl
eSB3ZXJlIHBhcnQgb2YgdGhlIGJhc2UgSVNBIHdoZW4gdGhlCj4gPiA+ID4gICAgKiBwb3J0ICYg
ZHQtYmluZGluZ3Mgd2VyZSB1cHN0cmVhbWVkLCBhbmQgc28gY2FuIGJlIHNldAo+ID4gPiA+ICAg
ICogdW5jb25kaXRpb25hbGx5IHdoZXJlIGBpYCBpcyBpbiByaXNjdixpc2Egb24gRFQgc3lzdGVt
cy4KPiA+ID4gPiAgICAqLwo+ID4gPiA+ICAgaWYgKGFjcGlfZGlzYWJsZWQpIHsKPiA+ID4gPiAg
ICAgICAgICAgc2V0X2JpdChSSVNDVl9JU0FfRVhUX1pJQ1NSLCBpc2FpbmZvLT5pc2EpOwo+ID4g
PiA+ICAgICAgICAgICBzZXRfYml0KFJJU0NWX0lTQV9FWFRfWklGRU5DRUksIGlzYWluZm8tPmlz
YSk7Cj4gPiA+ID4gICAgICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF9aSUNOVFIsIGlzYWlu
Zm8tPmlzYSk7Cj4gPiA+ID4gICAgICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF9aSUhQTSwg
aXNhaW5mby0+aXNhKTsKPiA+ID4gPiAgIH0KPiA+ID4gPgo+ID4gPgo+ID4gPiBZZXMsIEkgdGhp
bmsgdGhhdCdzIHJlYXNvbmFibGUsIGFzc3VtaW5nIHdlIGRvIGl0IGluIHRoZSBmaW5hbCAicGFz
cyIsCj4gPiA+IHdoZXJlIHdlJ3JlIHN1cmUgc3ZhZHUgaXNuJ3QgcHJlc2VudC4KPiA+Cj4gPiBJ
IGhhdmVuJ3QgdGhvdWdodCBhYm91dCBzcGVjaWZpY2FsbHkgd2hlbiB0byBkbyBpdCwgYnV0IGRv
ZXMgaXQgbmVlZCB0bwo+ID4gYmUgaW4gdGhlIGZpbmFsIHBhc3M/IElmIHdlIHdlcmUgdG8sIG9u
IGVhY2ggQ1BVLCBlbmFibGUgaXQgaWYgU3ZhZHUKPiA+IGlzbid0IHRoZXJlLCB3ZSdkIGVpdGhl
ciBlbmQgdXAgd2l0aCBhIHN5c3RlbSB0aGF0IEkgc3VzcGVjdCB3ZSdyZSBub3QKPiA+IGdvaW5n
IHRvIGJlIHN1cHBvcnRpbmcgb3IgdGhlIGNvcnJlY3QgcmVzdWx0LiBPciBhbSBJIG1pc3VuZGVy
c3RhbmRpbmcsCj4gPiBhbmQgaXQgd2lsbCBiZSB2YWxpZCB0byBoYXZlIGEgc3Vic2V0IG9mIENQ
VXMgdGhhdCBoYXZlIFN2YWR1IGVuYWJsZWQKPiA+IGZyb20gdGhlIGJvb3Rsb2FkZXI/Cj4gPgo+
ID4gTm90ZSB0aGF0IGl0IHdvdWxkIG5vdCBiZSBwcm9ibGVtYXRpYyB0byBoYXZlIDMgQ1BVcyB3
aXRoIFN2YWRlICsgU3ZhZHUKPiA+IGFuZCBhIDR0aCB3aXRoIG9ubHkgU3ZhZGUgaW4gdGhlIERU
IGJlY2F1c2Ugd2Ugd291bGQganVzdCBub3QgdXNlIHRoZQo+ID4gRldGVCBtZWNoYW5pc20gdG8g
ZW5hYmxlIFN2YWR1LiBJdCdzIGp1c3QgdGhlIFN2YWR1IGluIGlzb2xhdGlvbiBjYXNlCj4gPiB0
aGF0IEknbSBhc2tpbmcgYWJvdXQuCj4KPiBJIHdhc24ndCB0aGlua2luZyBhYm91dCB0aGUgcG90
ZW50aWFsIG9mIG1peG1hdGNoZWQgQS9EIHVkcGF0aW5nLiBJJ20KPiBwcmV0dHkgc3VyZSB0aGlz
IHdpbGwgYmUgb25lIG9mIHRob3NlIHRoaW5ncyB0aGF0IGlzIGFsbCBvciBub25lLiBJCj4gd2Fz
IG1vcmUgY29uY2VybmVkIHdpdGggZ2V0dGluZyB0aGUgcmVzdWx0IHJpZ2h0IGFuZCBJIGhhZCBq
dXN0IGJlZW4KPiB0b28gbGF6eSB0byBkb3VibGUgY2hlY2sgdGhhdCB0aGUgYmxvY2sgb2YgY29k
ZSB5b3UgcG9pbnRlZCBvdXQgaXMKPiBpbiB0aGUgcmlnaHQgcGxhY2UgdG8gYmUgc3VyZSB0aGVy
ZSdzIG5vIHN2YWR1LiBOb3cgdGhhdCBJIGxvb2ssIEkKPiBiZWxpZXZlIGl0IGlzLgo+Cj4gPgo+
ID4gPiBEb2luZyB0aGlzIGlzIGEgZ29vZCBpZGVhIHNpbmNlCj4gPiA+IHdlJ2xsIGJlIGFibGUg
dG8gc2ltcGxpZnkgY29uZGl0aW9ucywgYXMgd2UgY2FuIGp1c3QgdXNlICdpZiAoc3ZhZGUpJwo+
ID4gPiBzaW5jZSAhc3ZhZGUgd291bGQgaW1wbHkgc3ZhZHUuIFdpdGggRldGVCBhbmQgYm90aCwg
d2UnbGwgd2FudCB0byByZW1vdmUKPiA+ID4gc3ZhZGUgZnJvbSB0aGUgaXNhIGJpdG1hcCB3aGVu
IGVuYWJsaW5nIHN2YWR1Lgo+ID4KPiA+IFJpZ2h0IEkgd291bGQgbGlrZSB0byBtb3ZlIHRoZSB2
YXJpb3VzIGV4dGVuc2lvbiBzdHVmZiBpbiB0aGlzCj4gPiBkaXJlY3Rpb24sIHdoZXJlIHRoZXkg
aGF2ZSBhIGJpdCBtb3JlIGludGVsbGlnZW5jZSB0byB0aGVtLCBhbmQgZG9uJ3QKPiA+IGp1c3Qg
cmVmbGVjdCB0aGUgc3RhdGUgaW4gRFQvQUNQSSBkaXJlY3RseS4KPiA+IEkndmUgZ290IHNvbWUg
cGF0Y2hlcyBpbiBtaW5kIG9uY2UgQ2xlbWVudCdzIFpjYSBldGMgcGF0Y2hzZXQKPiA+IGlzIG1l
cmdlZCwgdGhpbmsgSSBwb3N0ZWQgb25lIG9yIHR3byBhcyByZXBsaWVzIHRvIGNvbnZlcnNhdGlv
bnMgb24KPiA+IHRoZSBsaXN0IGFscmVhZHkuIEFuIGV4YW1wbGUgd291bGQgYmUgZGlzYWJsaW5n
IHRoZSB2ZWN0b3IgY3J5cHRvCj4gPiBleHRlbnNpb25zIGlmIHdlJ3ZlIGhhZCB0byBkaXNhYmxl
IHZlY3Rvciwgb3IgYXMgeW91IHN1Z2dlc3QgaGVyZSwKPiA+IGRyb3BwaW5nIFN2YWRlIGlmIHdl
IGhhdmUgdHVybmVkIG9uIFN2YWR1IHVzaW5nIEZXRlQuIEkgdGhpbmsgdGhhdCBtYWtlcwo+ID4g
dGhlIEFQSXMgbW9yZSB1bmRlcnN0YW5kYWJsZSB0byBkZXZlbG9wZXJzIGFuZCBtb3JlIHVzZWZ1
bCB0aGFuIHRoZXkgYXJlCj4gPiBhdCB0aGUgbW9tZW50LCB3aGVyZSB0byB1c2UgdmVjdG9yIGNy
eXB0byB5b3UgYWxzbyBuZWVkIHRvIGNoZWNrIHZlY3Rvcgo+ID4gaXRzZWxmIGZvciB0aGUgY29k
ZSB0byBiZSBjb3JyZWN0LiBJZiBJIGNhbGwKPiA+IHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxh
YmxlKCksIGFuZCBpdCByZXR1cm5zIHRydWUsIHRoZSBleHRlbnNpb24KPiA+IHNob3VsZCBiZSB1
c2FibGUgSU1PLgoKVGhhbmsgeW91IGFsbCB2ZXJ5IG11Y2ghIEkgd2lsbCB1cGRhdGUgdGhlIGNv
ZGUgc28gdGhhdApyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgpCmNhbiByZWZsZWN0IHRo
ZSBwbGF0Zm9ybSdzIGJlaGF2aW9yLgoKUmVnYXJkcywKWW9uZy1YdWFuCgo+Cj4gU291bmRzIGdv
b2QgdG8gbWUuCj4KPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
