Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E590C678D6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 19:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q52YsCbUfFzGjhmJxTjj2eugNGtmUlXkwDBvB5FPqFI=; b=TZP8anEMAXky32
	KqZIvN2siWLcFOTfmuozTtlOMTCNuet9dhJd+Jr5/nt46efnmenmmBSYf4e2mWp1z7ss8LB+i/YwS
	jvZ1bJ534WWU4pOqA5AF++5ZbpLYdX09kKb7OlG/D43A0T+18xHXLpVROmkxfCCL9EbqXJ4n6fQ6M
	0Zs//PDenCKfGbw6u3y5JVso6Y+jRpXUYfYwgrGb0M/rN7uW9jxSqN1wQjKInwkHsILOpH+gIZBc/
	oS4iW6hwEvoB+G4uzR5rLoNEXnloM5ZQLqq6EU6I/GHdrsc5btLOqN38nKGs/01WL1Zbv8AUEsi4s
	Fx4mdKKbp4yupZJnTN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPfj-004D7w-I7; Fri, 13 Jan 2023 19:25:03 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPff-004D73-O9
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 19:25:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso15116810wmq.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jan 2023 11:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YR1JrLHd/rtFxm82ghcbpSNqJ9U6VT8clOL0KHLsa5M=;
        b=NoJzijQzwjgyIljHSYkYbk0seUpgWMQhS4NuAHMJ5TaSjbWObkY/jJmVcvvHUblMDF
         V51gDA14ckSsmKvpE4uyVCs3WkUhoiSjDpboE4NJKKLxx7ICT9Bd2Df0RZH+/IRpDBbU
         2UzBBHHY0wfQP08XyjerbkjyTFVlyXBa1BZYoEgWijek+piMp9ZDbJ3tXmlcGY+CG8NY
         TD0bzwQb/rskgWdcqKgEr4fScCzmCn6hDzwP/HovSGIvRRDQdw3VaRXnIqGpvJVNv2do
         favMDEmaZ3vAkGtSP4IRhGyOgD1hDEeI/05SsxfSwfUfdEePM5vg6d4OhtOxk+Pk/Uwv
         iNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YR1JrLHd/rtFxm82ghcbpSNqJ9U6VT8clOL0KHLsa5M=;
        b=ruj1ha00MsQWRk9P6VhMK/hIN6EHAztKXIfsuxksV+hmJpmuZZQrlEjHL+2BlWQQHL
         HcfMv3Tn8HguhlEtRjCGlRmFKJJbtg4rHMjqofWgUM5xyQIxElb/r4QiObWfEEUxvYyk
         5TePER/38Kx7aLoAHF64GbykJ8rpcHJEJfl95jMBC4OumrEV2cM0NPjivjqZw3XvgEP/
         kn5yXlx0wy7Ql88tGtTWStzhjbpnWnt77czoYfrAw89rPBKXYJlUJ8Obl36rPjiCcDUr
         1HKMx3jJu9eFyyNkwNUH4+1bJqBwYYVrc5NvmfQpzPDvSfA3WUcSLMMp7z6l5OvFsPGU
         9aog==
X-Gm-Message-State: AFqh2krvY+uHspyrIjiJy7g/9SQf6DDIPnDSaAZJ5EkEStFnpkVKP7Vm
	FsaF/u+k/N8Uxkm5BtlvcHIXkg==
X-Google-Smtp-Source: AMrXdXttwPsSq22LO3ha4/idlRRYyMS4mio7zLG55jfNREzxXrXYaXM7m5R+mxZHiRmL1afl9UouFQ==
X-Received: by 2002:a05:600c:4153:b0:3da:f0e:fe34 with SMTP id h19-20020a05600c415300b003da0f0efe34mr7914572wmm.32.1673637897138;
        Fri, 13 Jan 2023 11:24:57 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c444800b003c21ba7d7d6sm28362121wmn.44.2023.01.13.11.24.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Jan 2023 11:24:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 0/2] Change PWM-controlled LED pin active mode and
 algorithm
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Y8GjySjm9OjoZvCF@spud>
Date: Fri, 13 Jan 2023 19:24:56 +0000
Cc: Nylon Chen <nylon.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 nylon7717@gmail.com,
 zong.li@sifive.com,
 greentime.hu@sifive.com,
 vincent.chen@sifive.com,
 Thierry Reding <thierry.reding@gmail.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org
Message-Id: <95F1EAA0-D8D6-4F8A-8049-5E7BFDE4C06C@jrtc27.com>
References: <20230113083115.2590-1-nylon.chen@sifive.com>
 <Y8GjySjm9OjoZvCF@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_112459_826447_665BC338 
X-CRM114-Status: GOOD (  28.05  )
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

T24gMTMgSmFuIDIwMjMsIGF0IDE4OjMyLCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+
IHdyb3RlOgo+IAo+ICtDQyBVd2UsIFRoaWVycnksIGxpbnV4LXB3bQo+IAo+IEhleSBOeWxvbiwK
PiAKPiBQbGVhc2UgcnVuIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgYmVmb3JlIHNlbmRpbmcg
cGF0Y2hlcywgeW91IG1pc3NlZAo+IGJvdGggbWUgJiB0aGUgUFdNIG1haW50YWluZXJzIHVuZm9y
dHVuYXRlbHkhCj4gQUZBSUssIHRoZSBQV00gbWFpbnRhaW5lcnMgdXNlIHBhdGNod29yaywgc28g
eW91IHdpbGwgcHJvYmFibHkgaGF2ZSB0bwo+IHJlc2VuZCB0aGlzIHBhdGNoc2V0IHNvIHRoYXQg
aXQgaXMgb24gdGhlaXIgcmFkYXIuCj4gSSd2ZSBtYXJrZWQgdGhlIHNlcmllcyBhcyAiQ2hhbmdl
cyBSZXF1ZXN0ZWQiIG9uIHRoZSBSSVNDLVYgb25lLgo+IAo+IE9uIEZyaSwgSmFuIDEzLCAyMDIz
IGF0IDA0OjMxOjEzUE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gCj4+IEFjY29yZGluZyB0
byB0aGUgY2lyY3VpdCBkaWFncmFtIG9mIFVzZXIgTEVEcyAtIFJHQiBkZXNjcmliZWQgaW4gdGhl
Cj4+IG1hbnVhbCBoaWZpdmUtdW5tYXRjaGVkLXNjaGVtYXRpY3MtdjMucGRmWzBdLgo+PiBUaGUg
YmVoYXZpb3Igb2YgUFdNIGlzIGFjaXR2ZS1oaWdoLgo+PiAKPj4gQWNjb3JkaW5nIHRvIHRoZSBk
ZXNjcmlwdGlvbm9mIFBXTSBmb3IgcHdtY21wIGluIFNpRml2ZSBGVTc0MC1DMDAwCj4+IE1hbnVh
bFsxXS4KPj4gVGhlIHB3bSBhbGdvcml0aG0gaXMgKFBXKSBwdWxzZSBhY3RpdmUgdGltZSAgPSAo
RCkgZHV0eSAqIChUKSBwZXJpb2RbMl0uCj4+IFRoZSBgZnJhY2AgdmFyaWFibGUgaXMgcHVsc2Ug
ImluYWN0aXZlIiB0aW1lIHNvIHdlIG5lZWQgdG8gaW52ZXJ0IGl0Lgo+PiAKPj4gU28gdGhpcyBw
YXRjaHNldCByZW1vdmVzIGFjdGl2ZS1sb3cgaW4gRFRTIGFuZCBhZGRzIHJldmVyc2UgbG9naWMg
dG8KPj4gdGhlIGRyaXZlci4KPj4gCj4+IFswXTpodHRwczovL3NpZml2ZS1jaGluYS5vc3MtY24t
emhhbmdqaWFrb3UuYWxpeXVuY3MuY29tL0hpRkl2ZSUyMFVubWF0Y2hlZC9oaWZpdmUtdW5tYXRj
aGVkLXNjaGVtYXRpY3MtdjMucGRmCj4+IFsxXTpodHRwczovL3NpZml2ZS1jaGluYS5vc3MtY24t
emhhbmdqaWFrb3UuYWxpeXVuY3MuY29tL0hpRkl2ZSUyMFVubWF0Y2hlZC9mdTc0MC1jMDAwLW1h
bnVhbC12MXAyLnBkZgo+PiBbMl06aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvRHV0eV9j
eWNsZQo+IAo+IFBsZWFzZSBkZWxldGUgbGluayAyLCBjb252ZXJ0IHRoZSBvdGhlciB0d28gdG8g
c3RhbmRhcmQgTGluazogdGFncyBhbmQKPiBwdXQgdGhpcyBpbmZvcm1hdGlvbiBpbiB0aGUgZHRz
IHBhdGNoLiBQb3NzaWJseSBpbnRvIHRoZSBQV00gcGF0Y2ggdG9vLAo+IGRlcGVuZGluZyBvbiB3
aGF0IHRoZSBQV00gbWFpbnRhaW5lcnMgdGhpbmsuCj4gVGhpcyBpbmZvIHNob3VsZCBiZSBpbiB0
aGUgY29tbWl0IGhpc3RvcnkgSU1PIGFuZCB0aGUgY29tbWl0IG1lc3NhZ2UgZm9yCj4gdGhlIGR0
cyBwYXRjaCBzYXlzIHdoYXQncyBvYnZpb3VzIGZyb20gdGhlIGRpZmYgd2l0aG91dCBhbnkgZXhw
bGFuYXRpb24KPiBhcyB0byB3aHkuCj4gCj4gSSBkaWQgYSBiaXQgb2YgbG9va2luZyBhcm91bmQg
b24gbG9yZSwgdG8gc2VlIGlmIEkgY291bGQgZmlndXJlIG91dAo+IHdoeSBpdCB3YXMgZG9uZSBs
aWtlIHRoaXMgaW4gdGhlIGZpcnN0IHBsYWNlLCBhbmQgSSBmb3VuZDoKPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1wd20vQ0FKMl9qT0cyTTAzYUxCZ1VPZ0dqV0g5Q1V4cTJhVEc5N2VT
WDcwPVVhU2JHQ01NRl9nQG1haWwuZ21haWwuY29tLwoKVGhhdCBEVFMgZG9jdW1lbnRhdGlvbiBt
YWtlcyBubyBzZW5zZSB0byBtZSwgd2h5IGRvZXMgd2hhdCB0aGUgTEVEIGlzCndpcmVkIHRvIG1h
dHRlcj8gV2hldGhlciB5b3UgaGF2ZSB5b3VyIHRyYW5zaXN0b3IgbmV4dCB0byBncm91bmQgb3IK
bmV4dCB0byBWZGQgZG9lc27igJl0IG1hdHRlciwgd2hhdCBtYXR0ZXJzIGlzIHdoZXRoZXIgdGhl
IHRyYW5zaXN0b3IgaXMKb24gb3Igb2ZmLiBNYXliZSB3aGF0IHRoZXkgbWVhbiBpcyB3aGV0aGVy
IHRoZSAqUFdNJ3Mgb3V0cHV0KiAvICp0aGUKdHJhbnNpc3RvcidzIGlucHV0KiBpcyBwdWxsZWQg
dG8gZ3JvdW5kIG9yIFZkZD8gSW4gd2hpY2ggY2FzZSB0aGUKcHJvcGVydHkgd291bGQgaW5kZWVk
IG5vdCBhcHBseSBoZXJlLgoKVW5sZXNzIHRoYXTigJlzIHdyaXR0ZW4gYXNzdW1pbmcgdGhlIExF
RCBpcyB3aXJlZCBkaXJlY3RseSB0byB0aGUgUFdNLCBpbgp3aGljaCBjYXNlIGl0IHdvdWxkIG1h
a2Ugc2Vuc2UsIGJ1dCB0aGF04oCZcyBhIHZlcnkgbmFycm93LW1pbmRlZCB2aWV3IG9mCndoYXQg
dGhlIFBXTSBvdXRwdXQgaXMgKGRpcmVjdGx5KSBkcml2aW5nLgoKSmVzcwoKPiBUaGF0IGRvZXNu
J3QgZXhwbGFpbiB0aGUgZHJpdmVyLCBidXQgaXQgZG9lcyBleHBsYWluIHRoZSBkdHMgYmVpbmcg
dGhhdAo+IHdheS4gUGVyaGFwcyBhIEZpeGVzIHRhZyBpcyBhbHNvIGluIG9yZGVyPyBCdXQgb25s
eSBpZiBib3RoIHBhdGNoZXMgZ2V0Cj4gb25lLCBvdGhlcndpc2UgYmFja3BvcnRpbmcgd291bGQg
bGVhZCB0byBicmVha2FnZS4KPiAKPiBUaGUgbWluKCkgY29uc3RydWN0IGFwcGVhcnMgdG8gaGF2
ZSBiZWVuIHRoZXJlIHNpbmNlIHRoZSBSRkMgZHJpdmVyIHdhcwo+IGZpcnN0IHBvc3RlZC4KPiAK
PiBUaGFua3MsCj4gQ29ub3IuCj4gCj4+IAo+PiBOeWxvbiBDaGVuICgyKToKPj4gIHJpc2N2OiBk
dHM6IHNpZml2ZSB1bm1hdGNoZWQ6IFJlbW92ZSBQV00gY29udHJvbGxlZCBMRUQncyBhY3RpdmUt
bG93Cj4gCj4gbml0OiBzL3NpZml2ZSB1bm1hdGNoZWQ6L3NpZml2ZTogdW5tYXRjaGVkOi8KPiAK
Pj4gICAgcHJvcGVydGllcwo+PiAgcHdtOiBzaWZpdmU6IGNoYW5nZSB0aGUgUFdNIGNvbnRyb2xs
ZWQgTEVEIGFsZ29yaXRobQo+PiAKPj4gYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZl
LXVubWF0Y2hlZC1hMDAuZHRzIHwgNCAtLS0tCj4+IGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+PiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+PiAKPj4gLS0gCj4+IDIuMzYuMQo+PiAKPj4gCj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
