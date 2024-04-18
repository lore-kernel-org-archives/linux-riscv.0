Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600D3C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7Re52Qoxiwb1eyNX9l1IahQsejLQ3MYlk3tK4UDO70=; b=TI6wUMkkNpZ+x/
	OiUTy7lQ8nJJbZgdEJ8dHL9aEEd1rvDTkYEljCUS96GBXsNJfGmrlJsufDiLjOECsxnQqIJti7Gmc
	nCTJC//R3b1GsDeKyqmfvC8wJL7yb/6mkuYGTV8h5yKztdtpCEhOnhmR5Op3W2E0EBUZ1vRzLGLzl
	sfr6ZrqFtzKfIZiKdlntLYKgtijl1ppvqfovgsyhjQdJfK33CgC1BldeqzRok4hVhtm6UKssShZ6o
	5QFi8MD01OfF/murnHKIiI2dWVgUJLPX6YfQvo1lU+trfVIOhJsqzGAi7+i7u+thYNoSlRRtU3i9O
	9ikbYvahRBDijpBf9U4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxST9-00000002X8k-0iDZ;
	Thu, 18 Apr 2024 14:10:31 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxST2-00000002X83-0nd3
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 14:10:29 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-516d4d80d00so1143018e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713449421; x=1714054221; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d2TO+6uZMB/zwvZb021ALlLKsmPjZN9AI+Kk+fYRpT4=;
        b=Pr5w4H9VWY1aaiNMuliDpk03l7L502grNiYylnjtdM7/8d5+AsiQwZKEQEqFQgzPrW
         djCH+uzBWWLIRaV+fThKzL5rrVo70XSmPoZYOo9+Y/IH1SSKKT0ic4bedqqsP9eN9Lf5
         0p6C1+iXkqvv1lzoy8vHNuKY6R37dUxDSL9Q5YqSPL/RfMQY6FFRmwNuo/Awt2M0s2QJ
         T6lg8romfOoI3xgzPmI3fT6R2+QlUguK2B1EpAvQDF0cw4QD9T4E1Zkgxn0U5wE2HTQa
         6d88GnQsBanHwrIJ5nFNmpmAh+p8EPPUMYtHp4d9UVQg2cqcU2LzX+GYG0tG6RZN0LXX
         N+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449421; x=1714054221;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2TO+6uZMB/zwvZb021ALlLKsmPjZN9AI+Kk+fYRpT4=;
        b=dhSwsAfOLUiu97x5kIV2tEJ7xWNqU78XLBVYv9uqkxSCfiLbYmcx/6GdK0sEzZyDo6
         6F6EdRk0Eh9IQZpxwEe0BPIS2Qo/cSFRDf+Hl59KdACSzHXx354VseKufowDpO1Jkpa2
         SVrA0Ap/pRYlSUSjaDGqJBHMJGtkotVlINT7kt0jOjJdMpVBQsqMkuVvThAl8sdtL52g
         3jwZ9u0GKuIJ3BLu9I6jN+ZGEP06k3FEhivCDbYZHxQER9lREu5m2MybJfYlD2V7jjcJ
         4+XMXNhxORQHp7U2i9jJy+ugxtU5GPul4v6tTDjtkWY6PdVS3SclIFm7URTLmcIMNxQG
         A7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWynjsauQrWhXNjP5i8wKVdd/bVwpWvnYYnfDN0TCpZziDVRBPcXddHHl3td0O2HSvCWmMsRuB9Q2ESyLt2anl0AwD0sLRQedOEUnaWFEPA
X-Gm-Message-State: AOJu0YzGgC93QdWSUMs9BTmOgDsvwTdk6o5m1nvJzPa2rQbNBuypd5rw
	LRVxoMOFm+trPYwdxJ4KiBz6pRGm/JXaZgVBoKNIO1hdhloP4Q+EWbijG9v7XY0=
X-Google-Smtp-Source: AGHT+IE36Axh+eo8YV5jJfyakiHVt4NrWCVCrtov9Ii3lj1CXix1Y7yCbpKd8JrdXYX5BJ58eAHjBw==
X-Received: by 2002:ac2:4c3a:0:b0:518:e249:c10d with SMTP id u26-20020ac24c3a000000b00518e249c10dmr1792461lfq.37.1713449420877;
        Thu, 18 Apr 2024 07:10:20 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id oz34-20020a1709077da200b00a5271ae4458sm966288ejc.16.2024.04.18.07.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:10:20 -0700 (PDT)
Date: Thu, 18 Apr 2024 16:10:19 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com, 
	guoren@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lihangjing@bytedance.com, dengliang.1214@bytedance.com, xieyongji@bytedance.com, 
	chaiwen.cc@bytedance.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [External] Re: [RFC 0/2] riscv: Idle thread using Zawrs extension
Message-ID: <20240418-606209ea257878abceb8dc79@orel>
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
 <CAEg0e7gDk6SFRh4oF0KsA7xZoMr7RuZXFWL8qD7rmM2cBDLwcg@mail.gmail.com>
 <CAPYmKFsQQPCd-34GArHfC-Sv8PCYHgmZxprK3WHKnJquQDoXiQ@mail.gmail.com>
 <CAEg0e7hpjAec=2k+PwJeb0WezmJCFdUD=HbCiGe7+RxKgPHgtg@mail.gmail.com>
 <CAPYmKFudqq6Yg=uaVjAubCMM5TBMj8dkC0mXz+6eq3vNizTt7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPYmKFudqq6Yg=uaVjAubCMM5TBMj8dkC0mXz+6eq3vNizTt7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_071024_259622_F753DC89 
X-CRM114-Status: GOOD (  34.11  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMDk6MDk6MDZQTSArMDgwMCwgWHUgTHUgd3JvdGU6Cj4g
T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgODo1NuKAr1BNIENocmlzdG9waCBNw7xsbG5lcgo+IDxj
aHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgQXByIDE4
LCAyMDI0IGF0IDI6NDTigK9QTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDg6MjbigK9QTSBDaHJpc3Rv
cGggTcO8bGxuZXIKPiA+ID4gPGNocmlzdG9waC5tdWVsbG5lckB2cnVsbC5ldT4gd3JvdGU6Cj4g
PiA+ID4KPiA+ID4gPiBPbiBUaHUsIEFwciAxOCwgMjAyNCBhdCAxOjUw4oCvUE0gWHUgTHUgPGx1
eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMg
cGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgYSBuZXcgaW1wbGVtZW50YXRpb24gb2YgaWRsZSB0aHJl
YWQgdXNpbmcKPiA+ID4gPiA+IFphd3JzIGV4dGVuc2lvbi4KPiA+ID4gPgo+ID4gPiA+IFRoaXMg
b3ZlcmxhcHMgd2l0aCB0aGUgZm9sbG93aW5nIHNlcmllczoKPiA+ID4gPiAgIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMxNTEzNDAwOS41ODAxNjctNy1ham9uZXNAdmVudGFuYW1p
Y3JvLmNvbS8KPiA+ID4KPiA+ID4gSGkgQ2hyaXN0b3BoLgo+ID4gPiBUaGFua3MgZm9yIHlvdXIg
cmVwbHkhCj4gPiA+IEFjdHVhbGx5IG91ciBwYXRjaCBzZXJpZXMgaXMgZGlmZmVyZW50IGZyb20g
dGhpcy4gVGhlIHdvcmsgZnJvbSB5b3VyCj4gPiA+IGxpbmsgZm9jdXNlcyBvbiBwcm92aWRpbmcg
c3VwcG9ydCBmb3IgWmF3cnMgYW5kIGltcGxlbWVudGluZyBzcGlubG9jawo+ID4gPiB1c2luZyBp
dCwgd2hpbGUgb3VyIHdvcmsgZm9jdXNlcyBvbiBpbXBsZW1lbnRpbmcgaWRsZSB0aHJlYWQgdXNp
bmcKPiA+ID4gWmF3cnMgYW5kIGFjY2VsZXJhdGluZyBJUEkgdG8gaWRsZSBjcHUuIE9mIGNvdXJz
ZSwgdGhlIElTQSBaQVdSUwo+ID4gPiBjb25maWcgcGFydCBjYW4gYmUgbWVyZ2VkLiBXZSB3aWxs
IHJlZmluZSBvdXIgY29kZSBpbiB0aGUgbmV4dCB2ZXJzaW9uCj4gPiA+IHRvIHJlZHVjZSBjb2Rl
IGNvbmZsaWN0cy4KPiA+Cj4gPiBZZXMsIEkndmUgc2VlbiB0aGF0IHRoaXMgdGFyZ2V0cyBhbm90
aGVyIG9wdGltaXphdGlvbiwgYnV0IHRoZSBiYXNpYwo+ID4gWmF3cnMgc3VwcG9ydAo+ID4gd291
bGQgYmUgaWRlbnRpY2FsIHRvIHRoZSBvdGhlciBwYXRjaHNldCAoZXZlbiBpZiBpdCBpcyBub3Qp
Lgo+ID4gSSB3b3VsZCBwcm9wb3NlIHRoYXQgd2Ugd29yayBvbiBhIGJhc2ljIFphd3JzIHN1cHBv
cnQgcGF0Y2hzZXQgdGhhdCBpbnRyb2R1Y2VzCj4gPiB0aGUgS2NvbmZpZywgRFRTIGFuZCBod3By
b2JlIHBhcnRzIChhIHN1YnNldCBvZiBBbmRyZXcncyBwYXRjaHNldCkuCj4gPiBPbmNlIHRoaXMg
aXMgbWVyZ2VkLCBhbGwgb3RoZXIgb3B0aW1pemF0aW9ucyBjYW4gYmUgYnVpbHQgdXBvbiBpdAo+
ID4gKHNwaW5sb2NrcywgaWRsZSB0aHJlYWQsIGdsaWJjIENQVSBzcGlubmluZykuCj4gPiBJZiB0
aGlzIHByb3Bvc2FsIGlzIGZpbmUgZm9yIHRoZSBtYWludGFpbmVycy9yZXZpZXdlcnMsIHRoZW4g
QW5kcmV3IGNvdWxkIHJlc2VuZAo+ID4gdGhlc2UgYmFzaWMtc3VwcG9ydCBwYXRjaGVzLgo+ID4K
PiA+IEJSCj4gPiBDaHJpc3RvcGgKPiAKPiBSb2dlciB0aGF0ISBUaGlzIGRvZXMgbWFrZSBtb3Jl
IHNlbnNlLiBXZSB3aWxsIHJlYmFzZSBvdXIgY29kZSBvbgo+IEFuZHJldydzIGJhc2ljIHN1cHBv
cnQgcGF0Y2hlcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKQW5kIEknbSBqdXN0IGFib3V0IHRvIHNl
bmQgdGhhdCBuZXh0IHZlcnNpb24uIEknbGwgc2VuZCB0b21vcnJvdyBtb3JuaW5nCmlmIG5vdCB5
ZXQgdG9kYXkuCgpUaGFua3MsCmRyZXcKCgoKPiAKPiBSZWdhcmRzLAo+IFh1IEx1Cj4gCj4gPgo+
ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEJSCj4gPiA+ID4gQ2hyaXN0b3BoCj4gPiA+ID4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBUaGUgWmF3cnNbMF0gZXh0ZW5zaW9uIGludHJvZHVjZXMgdHdvIG5l
dyBpbnN0cnVjdGlvbnMgbmFtZWQgV1JTLlNUTyBhbmQKPiA+ID4gPiA+IFdSUy5OVE8gaW4gUklT
Qy1WLiBXaGVuIHNvZnR3YXJlIHJlZ2lzdGVycyBhIHJlc2VydmF0aW9uIHNldCB1c2luZyBMUgo+
ID4gPiA+ID4gaW5zdHJ1Y3Rpb24sIGEgc3Vic2VxdWVudCBXUlMuU1RPIG9yIFdSUy5OVE8gaW5z
dHJ1Y3Rpb24gd2lsbCBjYXVzZSB0aGUKPiA+ID4gPiA+IGhhcnQgdG8gc3RhbGwgaW4gYSBsb3ct
cG93ZXIgc3RhdGUgdW50aWwgYSBzdG9yZSBoYXBwZW5zIHRvIHRoZQo+ID4gPiA+ID4gcmVzZXJ2
YXRpb24gc2V0IG9yIGFuIGludGVycnVwdCBiZWNvbWVzIHBlbmRpbmcuIFRoZSBkaWZmZXJlbmNl
IGJldHdlZW4KPiA+ID4gPiA+IHRoZXNlIHR3byBpbnN0cnVjdGlvbnMgaXMgdGhhdCBXUlMuU1RP
IHdpbGwgdGVybWluYXRlIHN0YWxsIGFmdGVyIGFuCj4gPiA+ID4gPiBpbXBsZW1lbnRhdGlvbi1k
ZWZpbmVkIHRpbWVvdXQgd2hpbGUgV1JTLk5UTyB3b24ndC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBU
aGlzIHBhdGNoIHNlcmllcyBpbXBsZW1lbnRzIGlkbGUgdGhyZWFkIHVzaW5nIFdSUy5OVE8gaW5z
dHJ1Y3Rpb24uCj4gPiA+ID4gPiBCZXNpZGVzLCB3ZSBmb3VuZCB0aGVyZSBpcyBubyBuZWVkIHRv
IHNlbmQgYSByZWFsIElQSSB0byB3YWtlIHVwIGFuIGlkbGUKPiA+ID4gPiA+IENQVS4gSW5zdGVh
ZCwgd2Ugd3JpdGUgSVBJIGluZm9ybWF0aW9uIHRvIHRoZSByZXNlcnZhdGlvbiBzZXQgb2YgYW4g
aWRsZQo+ID4gPiA+ID4gQ1BVIHRvIHdha2UgaXQgdXAgYW5kIGxldCBpdCBoYW5kbGUgSVBJIHF1
aWNrbHksIHdpdGhvdXQgZ29pbmcgdGhyb3VnaAo+ID4gPiA+ID4gdHJhbmRpdGlvbmFsIGludGVy
cnVwdCBoYW5kbGluZyByb3V0aW5lLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFswXSBodHRwczovL2dp
dGh1Yi5jb20vcmlzY3YvcmlzY3YtemF3cnMvYmxvYi9tYWluL3phd3JzLmFkb2MKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBYdSBMdSAoMik6Cj4gPiA+ID4gPiAgIHJpc2N2OiBwcm9jZXNzOiBJbnRyb2R1
Y2UgaWRsZSB0aHJlYWQgdXNpbmcgWmF3cnMgZXh0ZW5zaW9uCj4gPiA+ID4gPiAgIHJpc2N2OiBV
c2UgWmF3cnMgdG8gYWNjZWxlcmF0ZSBJUEkgdG8gaWRsZSBjcHUKPiA+ID4gPiA+Cj4gPiA+ID4g
PiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAyNCArKysrKysrCj4gPiA+
ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVpZGxlLmggICB8ICAxMSArLS0tCj4gPiA+
ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICB8ICAgMSArCj4gPiA+ID4g
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8ICAzMSArKysrKysrKysKPiA+
ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NtcC5oICAgICAgIHwgIDE0ICsrKysKPiA+
ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyAgICAgICAgICAgIHwgICA1ICsrCj4gPiA+
ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICB8ICAgMSArCj4gPiA+ID4g
PiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICB8IDEwMiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrLQo+ID4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3NtcC5jICAgICAg
ICAgICAgfCAgMzkgKysrKysrKy0tLS0KPiA+ID4gPiA+ICA5IGZpbGVzIGNoYW5nZWQsIDIwNSBp
bnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtLQo+ID4g
PiA+ID4gMi4yMC4xCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gPiBsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKPiA+ID4gPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+
ID4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
