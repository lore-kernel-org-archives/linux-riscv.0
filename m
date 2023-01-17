Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCA3C63797
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 09:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qS25v01n8b8pApIGQjU6V31aBgutJZ0pQEN/ZG3T1Os=; b=umjiL2takdOE01
	mEd9H9jCND1PYWIilXy5mKlSJCtgPTChLU+jvDpRz7g+JEcXpT1ZJr+qQYHtc3IEt/vzG9h+Q5Bji
	AkTkCCD3KIgjxJTCERortBF8s+KCOrAfT5vPWzrrFXnJLdLm72Qnd9M4glbm69P1RtQOglxQhbOic
	mtDdTwj8oL+1rQu+8NsRHKp7xmA1Z4tLX7aFqHNxfypUt2wrGsXkPZKpmGJGZkbbrnO08+WMPwg4Q
	RmhXc/Zjm2IxldVNKbVDT1OjD8RA5W8VyFk0eBV+kYsdyoGeFlerc/OXfbWk5ruRSJwHDBUhtBIjC
	/9Nt3FWRi+B6c7OAFw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHiL5-00Daht-Su; Tue, 17 Jan 2023 09:33:07 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHiKu-00DacU-DJ
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 09:32:58 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4d0f843c417so300625347b3.7
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jan 2023 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FV9nUVm/3W8S9XiP51zEd4Rl44Fcj8LLaPZ2bVwALNE=;
        b=T7CgfJmnRp3JHN/VR2DJA2oyuzskW7ry7gryfRwHM6Kf/pwwm4aN3D/1fVDcakoMpK
         ZM61iW6f819f4/PK4wzG2DggDR51HP0ebzGUQ4vTirnJQe7A2oMZhVSG5XYet+V/h2LV
         WfhT4acFhTh8nE+ZDd6B3RVb+BayfTGynKysQbQ/dLmqKZeB5vCy4QAd0szmUVCHRXpE
         lsqFG/uqBqpzlOC9c6NeFSMCE71igtRKQD07+EUg9QTIZxXffJDoueOFknwpwkHtMw2+
         E/UA9+4VZOl6daYFtUfDujEIosnxyBf8L3Ju+UTGh70rLPoMkV1yaatcF46Fy8KRdZNP
         3X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FV9nUVm/3W8S9XiP51zEd4Rl44Fcj8LLaPZ2bVwALNE=;
        b=o0eomCjDUu92I/zl+yW49+HqteDxmLOg+qzPjHTvJn77rH+n6K5AsNKNIp42a7yKhs
         VQOkTfV/1SJcW256QZvHrT4B74SK1nMeH2MRBtdhxQj4dVTORol9GERBhleY0FHvDI3c
         Hbhh+/h7FuiEwrAJemswIotzA+cC7dZRPRLfbLcOyTlOc1Ur53L6EI7yygY6Xk09zZNo
         KUrDkSqOCwAgM3j2NCeQnB3pKugjm2frhIYQyAPc4VjmvtTkKIIODms+1ieL0hqpwqZo
         RhzTedOfcC/dStMUPYioJFj/1fFbzwfdueoFpUqYa91zc2ckYe3zU/NMu8HhkkGia3Ez
         22wA==
X-Gm-Message-State: AFqh2kpE29GxlXN/34s5YJYTrFPblQFuVb1Qj9gZPmacxAPzxEgCCnIN
	rVpUalaK6CK9th517jLnzLEuALPnX22tvn8m4Zzf9Q==
X-Google-Smtp-Source: AMrXdXvST+rBmxbQ9ZJsNpKFtnIQx3FB5ioNsIlBUX/oGsXIVVOg1Z8MnqkrQal43ozZal2Js56bI5hKZ38ZxjmSwyw=
X-Received: by 2002:a81:9b95:0:b0:3ea:9ce2:cd76 with SMTP id
 s143-20020a819b95000000b003ea9ce2cd76mr342335ywg.217.1673947972381; Tue, 17
 Jan 2023 01:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20230113083115.2590-1-nylon.chen@sifive.com> <Y8GjySjm9OjoZvCF@spud>
 <95F1EAA0-D8D6-4F8A-8049-5E7BFDE4C06C@jrtc27.com>
In-Reply-To: <95F1EAA0-D8D6-4F8A-8049-5E7BFDE4C06C@jrtc27.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 17 Jan 2023 17:32:40 +0800
Message-ID: <CAHh=Yk-WJMOc-h9V47CyMQpyXZ5hDrtOPnPE2QKkJKzMhjh+Cg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Change PWM-controlled LED pin active mode and algorithm
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, nylon7717@gmail.com, zong.li@sifive.com, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_013256_526229_BDBF2D3D 
X-CRM114-Status: GOOD (  38.38  )
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

SGkgQ29ub3IsIEplc3NpY2EKCnRoYW5rcyBmb3IgeW91ciByZXBseS4KCkplc3NpY2EgQ2xhcmtl
IDxqcnRjMjdAanJ0YzI3LmNvbT4g5pa8IDIwMjPlubQx5pyIMTTml6Ug6YCx5YWtIOS4iuWNiDM6
MjTlr6vpgZPvvJoKPgo+IE9uIDEzIEphbiAyMDIzLCBhdCAxODozMiwgQ29ub3IgRG9vbGV5IDxj
b25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiArQ0MgVXdlLCBUaGllcnJ5LCBsaW51eC1w
d20KPiA+Cj4gPiBIZXkgTnlsb24sCj4gPgo+ID4gUGxlYXNlIHJ1biBzY3JpcHRzL2dldF9tYWlu
dGFpbmVyLnBsIGJlZm9yZSBzZW5kaW5nIHBhdGNoZXMsIHlvdSBtaXNzZWQKPiA+IGJvdGggbWUg
JiB0aGUgUFdNIG1haW50YWluZXJzIHVuZm9ydHVuYXRlbHkhCj4gPiBBRkFJSywgdGhlIFBXTSBt
YWludGFpbmVycyB1c2UgcGF0Y2h3b3JrLCBzbyB5b3Ugd2lsbCBwcm9iYWJseSBoYXZlIHRvCj4g
PiByZXNlbmQgdGhpcyBwYXRjaHNldCBzbyB0aGF0IGl0IGlzIG9uIHRoZWlyIHJhZGFyLgo+ID4g
SSd2ZSBtYXJrZWQgdGhlIHNlcmllcyBhcyAiQ2hhbmdlcyBSZXF1ZXN0ZWQiIG9uIHRoZSBSSVND
LVYgb25lLgpJIGdvdCBpdC4gSSB3aWxsIGJhc2UgaXQgb24gZ2V0X21haW50YWluZXIucGwsIHJl
LXNlbnQgaXQuCj4gPgo+ID4gT24gRnJpLCBKYW4gMTMsIDIwMjMgYXQgMDQ6MzE6MTNQTSArMDgw
MCwgTnlsb24gQ2hlbiB3cm90ZToKPiA+Cj4gPj4gQWNjb3JkaW5nIHRvIHRoZSBjaXJjdWl0IGRp
YWdyYW0gb2YgVXNlciBMRURzIC0gUkdCIGRlc2NyaWJlZCBpbiB0aGUKPiA+PiBtYW51YWwgaGlm
aXZlLXVubWF0Y2hlZC1zY2hlbWF0aWNzLXYzLnBkZlswXS4KPiA+PiBUaGUgYmVoYXZpb3Igb2Yg
UFdNIGlzIGFjaXR2ZS1oaWdoLgo+ID4+Cj4gPj4gQWNjb3JkaW5nIHRvIHRoZSBkZXNjcmlwdGlv
bm9mIFBXTSBmb3IgcHdtY21wIGluIFNpRml2ZSBGVTc0MC1DMDAwCj4gPj4gTWFudWFsWzFdLgo+
ID4+IFRoZSBwd20gYWxnb3JpdGhtIGlzIChQVykgcHVsc2UgYWN0aXZlIHRpbWUgID0gKEQpIGR1
dHkgKiAoVCkgcGVyaW9kWzJdLgo+ID4+IFRoZSBgZnJhY2AgdmFyaWFibGUgaXMgcHVsc2UgImlu
YWN0aXZlIiB0aW1lIHNvIHdlIG5lZWQgdG8gaW52ZXJ0IGl0Lgo+ID4+Cj4gPj4gU28gdGhpcyBw
YXRjaHNldCByZW1vdmVzIGFjdGl2ZS1sb3cgaW4gRFRTIGFuZCBhZGRzIHJldmVyc2UgbG9naWMg
dG8KPiA+PiB0aGUgZHJpdmVyLgo+ID4+Cj4gPj4gWzBdOmh0dHBzOi8vc2lmaXZlLWNoaW5hLm9z
cy1jbi16aGFuZ2ppYWtvdS5hbGl5dW5jcy5jb20vSGlGSXZlJTIwVW5tYXRjaGVkL2hpZml2ZS11
bm1hdGNoZWQtc2NoZW1hdGljcy12My5wZGYKPiA+PiBbMV06aHR0cHM6Ly9zaWZpdmUtY2hpbmEu
b3NzLWNuLXpoYW5namlha291LmFsaXl1bmNzLmNvbS9IaUZJdmUlMjBVbm1hdGNoZWQvZnU3NDAt
YzAwMC1tYW51YWwtdjFwMi5wZGYKPiA+PiBbMl06aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dp
a2kvRHV0eV9jeWNsZQo+ID4KPiA+IFBsZWFzZSBkZWxldGUgbGluayAyLCBjb252ZXJ0IHRoZSBv
dGhlciB0d28gdG8gc3RhbmRhcmQgTGluazogdGFncyBhbmQKPiA+IHB1dCB0aGlzIGluZm9ybWF0
aW9uIGluIHRoZSBkdHMgcGF0Y2guIFBvc3NpYmx5IGludG8gdGhlIFBXTSBwYXRjaCB0b28sCj4g
PiBkZXBlbmRpbmcgb24gd2hhdCB0aGUgUFdNIG1haW50YWluZXJzIHRoaW5rLgpJIGdvdCBpdC4g
SSB3aWxsIGZpeCBpdC4KPiA+IFRoaXMgaW5mbyBzaG91bGQgYmUgaW4gdGhlIGNvbW1pdCBoaXN0
b3J5IElNTyBhbmQgdGhlIGNvbW1pdCBtZXNzYWdlIGZvcgo+ID4gdGhlIGR0cyBwYXRjaCBzYXlz
IHdoYXQncyBvYnZpb3VzIGZyb20gdGhlIGRpZmYgd2l0aG91dCBhbnkgZXhwbGFuYXRpb24KPiA+
IGFzIHRvIHdoeS4KPiA+Cj4gPiBJIGRpZCBhIGJpdCBvZiBsb29raW5nIGFyb3VuZCBvbiBsb3Jl
LCB0byBzZWUgaWYgSSBjb3VsZCBmaWd1cmUgb3V0Cj4gPiB3aHkgaXQgd2FzIGRvbmUgbGlrZSB0
aGlzIGluIHRoZSBmaXJzdCBwbGFjZSwgYW5kIEkgZm91bmQ6Cj4gPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1wd20vQ0FKMl9qT0cyTTAzYUxCZ1VPZ0dqV0g5Q1V4cTJhVEc5N2VTWDcw
PVVhU2JHQ01NRl9nQG1haWwuZ21haWwuY29tLwo+Cj4gVGhhdCBEVFMgZG9jdW1lbnRhdGlvbiBt
YWtlcyBubyBzZW5zZSB0byBtZSwgd2h5IGRvZXMgd2hhdCB0aGUgTEVEIGlzCj4gd2lyZWQgdG8g
bWF0dGVyPyBXaGV0aGVyIHlvdSBoYXZlIHlvdXIgdHJhbnNpc3RvciBuZXh0IHRvIGdyb3VuZCBv
cgo+IG5leHQgdG8gVmRkIGRvZXNu4oCZdCBtYXR0ZXIsIHdoYXQgbWF0dGVycyBpcyB3aGV0aGVy
IHRoZSB0cmFuc2lzdG9yIGlzCj4gb24gb3Igb2ZmLiBNYXliZSB3aGF0IHRoZXkgbWVhbiBpcyB3
aGV0aGVyIHRoZSAqUFdNJ3Mgb3V0cHV0KiAvICp0aGUKPiB0cmFuc2lzdG9yJ3MgaW5wdXQqIGlz
IHB1bGxlZCB0byBncm91bmQgb3IgVmRkPyBJbiB3aGljaCBjYXNlIHRoZQo+IHByb3BlcnR5IHdv
dWxkIGluZGVlZCBub3QgYXBwbHkgaGVyZS4KPgo+IFVubGVzcyB0aGF04oCZcyB3cml0dGVuIGFz
c3VtaW5nIHRoZSBMRUQgaXMgd2lyZWQgZGlyZWN0bHkgdG8gdGhlIFBXTSwgaW4KPiB3aGljaCBj
YXNlIGl0IHdvdWxkIG1ha2Ugc2Vuc2UsIGJ1dCB0aGF04oCZcyBhIHZlcnkgbmFycm93LW1pbmRl
ZCB2aWV3IG9mCj4gd2hhdCB0aGUgUFdNIG91dHB1dCBpcyAoZGlyZWN0bHkpIGRyaXZpbmcuCj4K
PiBKZXNzCj4KVGhpcyBpcyBhIEhpRml2ZSBVbm1hdGNoZWQvVW5sZWFzaGVkIExFRC1QV00gbGF5
b3V0CgogICAgICAgICAgICBWREQKICAgICAgICAgICAgICAgfAogICAgICAgICAgICAgICB8CiAg
ICAgICAgICAgX19fX18KICAgICAgICAgICBcICAgICAgICAvICAgTEVECiAgICAgICAgICAgIFwg
ICAgIC8KICAgICAgICAgICAgICAtLS0KICAgICAgICAgICAgICAgfAogICAgICAgICAgICAgICB8
CiAgICAgICAgICAgICAgIHwKICAgICAgICAgX19fX19fCiAgICAgICAgfCAgICAgICAgICAgICAg
fAogICAgICAgIC0gICAgICAgICAgICAgfAogICAgICAgIF4gICAgLS0+ICAgIHwtLS0tLS0gUFdN
CiAgICAgICAgfF9fX3xfX198CiAgICAgICAgICAgICAgIHwKICAgICAgICAgICAgICAgfAogICAg
ICAgICAgICAgIF9fCiAgICAgICAgICAgICAgIC0KICAgICAgICAgICAgR05ECgotIHRoZSB3YXZl
Zm9ybQplLmcuIGR1dHk9MzBzLCBwZXJpb2Q9MTAwcywgYWN0dmllLWhpZ2ggPSAzMCUsIGFjdGl2
ZS1sb3cgPSA3MCUKClYKXgp8CnwgLS0tLS0tLS0tLXwKfCAgICAgICAgICAgICB8CnwgICAgICAg
ICAgICAgfAp8X19fX19fIHxfX19fX19fX19fID4gdAoKV2hlbiBWQ0MgaXMgaGlnaCwgdGhlIExF
RCB3aWxsIGJlIGlsbHVtaW5hdGVkLCB3aGljaCBpcyBhbiBhY3RpdmUtaGlnaApsb2dpYy4gVGhp
cyBpcyB3aHkgd2UgbmVlZCB0byByZW1vdmUgImFjdGl2ZS1sb3ciLgoKU28sIGFjY29yZGluZyB0
byBteSB1bmRlcnN0YW5kaW5nLCBVbmxlYXNoZWQncyBEVFMgc2hvdWxkIGFsc28gcmVtb3ZlCmFj
dGl2ZS1sb3cuCj4gPiBUaGF0IGRvZXNuJ3QgZXhwbGFpbiB0aGUgZHJpdmVyLCBidXQgaXQgZG9l
cyBleHBsYWluIHRoZSBkdHMgYmVpbmcgdGhhdAo+ID4gd2F5LiBQZXJoYXBzIGEgRml4ZXMgdGFn
IGlzIGFsc28gaW4gb3JkZXI/IEJ1dCBvbmx5IGlmIGJvdGggcGF0Y2hlcyBnZXQKPiA+IG9uZSwg
b3RoZXJ3aXNlIGJhY2twb3J0aW5nIHdvdWxkIGxlYWQgdG8gYnJlYWthZ2UuCj4gPgo+ID4gVGhl
IG1pbigpIGNvbnN0cnVjdCBhcHBlYXJzIHRvIGhhdmUgYmVlbiB0aGVyZSBzaW5jZSB0aGUgUkZD
IGRyaXZlciB3YXMKPiA+IGZpcnN0IHBvc3RlZC4KPiA+Cj4gPiBUaGFua3MsCj4gPiBDb25vci4K
PiA+Cj4gPj4KPiA+PiBOeWxvbiBDaGVuICgyKToKPiA+PiAgcmlzY3Y6IGR0czogc2lmaXZlIHVu
bWF0Y2hlZDogUmVtb3ZlIFBXTSBjb250cm9sbGVkIExFRCdzIGFjdGl2ZS1sb3cKPiA+Cj4gPiBu
aXQ6IHMvc2lmaXZlIHVubWF0Y2hlZDovc2lmaXZlOiB1bm1hdGNoZWQ6LwpJIGdvdCBpdC4gSSB3
aWxsIGZpeCBpdC4KCj4gPgo+ID4+ICAgIHByb3BlcnRpZXMKPiA+PiAgcHdtOiBzaWZpdmU6IGNo
YW5nZSB0aGUgUFdNIGNvbnRyb2xsZWQgTEVEIGFsZ29yaXRobQo+ID4+Cj4gPj4gYXJjaC9yaXNj
di9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzIHwgNCAtLS0tCj4gPj4g
ZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAr
Cj4gPj4gMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKPiA+
Pgo+ID4+IC0tCj4gPj4gMi4zNi4xCj4gPj4KPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
