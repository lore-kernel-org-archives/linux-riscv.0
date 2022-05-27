Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F965C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OpRJ4G/T9d+Qd6zQOjQQvo8E1bmXM1YQFuTQ7vtXgk=; b=AJloHyZqjpZ9pJ
	CTv84q62+/lN7SRrSpv6DuCFya0+6tvb27JMOgGVtYTutB8OUUjoNbCizY7Txwt0pySb2nyEhcjQt
	IZiM55j+nHhlMSAPMNjByttkpMqldn60zP50/6BinV9OVCkD0hhxEBnV49f968mMNEAMSUhuMecQV
	Esnu2zNuMPiZ+DDO6OLh3KF5uQaYQCLcuzW1+/1TCrm21e5DJVldBCy8/r39y52MPe9b2a5Gvn61+
	v/R24Yjuzvz/hWGb88Y58DQ2A9qs6BPrHWEDqXRandbwQKOeEwIHRwXaRKZCOvTuT5NZ9rY31NhoX
	65apJ/wu2x2bkQWzcqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nudWH-000cbK-IZ; Fri, 27 May 2022 17:13:01 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nudWD-000cYv-Tb
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 17:12:59 +0000
Received: by mail-lf1-x129.google.com with SMTP id p4so7843930lfg.4
        for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 10:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BYfKxzmiSc8SXMi7nnVlNMFrEJWK3jR/x/7p9iLgKOY=;
        b=G3/g96Qs0vJYxzxSnaW8y9z772oSQAHmdbamtPI128d9PFxY1PhF/Z34c5hiRUMv1v
         XkWBKogGtXznBbs2fXp2jBB224/z5aXNhHiC9HnP+HblTC7GxDc+Sh3Ag6x9rdkw2i05
         XjnVA8mJhBLP8ngyCDK/N6xaQ6XDu9gTuv5rUSiBLCHXOUOKQlu0SLvCobCVLSCY3jXt
         C+B2zFmWo3+3ttfHw6rnkgVBVY453wP5C8nvRBggY4GtcF0zoaYsdjJNpu+/vSVGSSO9
         nuImwGA7XFNTrntP5sjWu8uSMYP3ecQxflsMKTlcZgUPmSnhijFXBqF5I3uap0fajY+q
         WKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BYfKxzmiSc8SXMi7nnVlNMFrEJWK3jR/x/7p9iLgKOY=;
        b=vAcgsGSVgZqZFSnkSgdpIEdRE19O6v1uuu6n7cx+yoFSIyU72Z1bdZGMnNkaGc5mza
         PdZ9rwqHzrM55Sl4oeXsXq76N+G29kT8ZyI/0YJw17ere8uePZTddx9PXKJiAMGVm3W7
         rRpIAdar20quBR4u5IEyM2dr3GY/PLSk0dqIc6BF0JAdSvIuYUmqybbSdKLHdfy1ImEY
         QcX95No7nHzRejhLV0E06Y6Qt6ncCqGAaAcJXa1NU20URVccL/k7kDNHRQNyKbBqIDtO
         Av//Eq8TIQWf0jPBpZa0GQDWBnt1D5svVeB72h0aTVVEh3OPUJzZUfbLE+v4E1x1boZ8
         zi6g==
X-Gm-Message-State: AOAM533wJgFvfqiF2BV9CvVMr18ar9a8l3f0Su7/CajBqxDIak3XHWcJ
	4ymZKjJJL0WBZPvXR/rQuNQHgfpA04wcmB1oIt/Vog==
X-Google-Smtp-Source: ABdhPJwRbUDyn7ize5qWK55exwtEd+JwuttsQLlWEO9yWfY6SHmQBIPsgeNF4FACqMAARkKIDQEiBDG5ZImNr1igk2Y=
X-Received: by 2002:a05:6512:1156:b0:478:79b1:583c with SMTP id
 m22-20020a056512115600b0047879b1583cmr17236563lfg.206.1653671573571; Fri, 27
 May 2022 10:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d0437b05dffdd1de@google.com> <CACT4Y+Y8DOKJtwhRsyNT7G26C3Fx_oeibpXn43Ks0RtYYdZG3g@mail.gmail.com>
 <36f4745f-0e47-4f49-8f4e-ff7544f163d8n@googlegroups.com> <CACT4Y+Zy7wLdeRCa+ZH-swo9ut=U6pEk4rP461QE1m-gT6s-uQ@mail.gmail.com>
 <a55430c3-a0bc-4af6-b7e2-20f2e0d091b2n@googlegroups.com> <CACT4Y+ar18tcxx0tOthV0JBrmWsLXtXAjXVFX4sac5k1UGJ7Lw@mail.gmail.com>
In-Reply-To: <CACT4Y+ar18tcxx0tOthV0JBrmWsLXtXAjXVFX4sac5k1UGJ7Lw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 27 May 2022 19:12:41 +0200
Message-ID: <CACT4Y+ZAazG7UjKE1ZHq72bh4Ve1r3_Hw+zcONYoO1J959sukw@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes test error: lost connection to test machine
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
	syzbot <syzbot+2c5da6a0a16a0c4f34aa@syzkaller.appspotmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_101258_010084_30E891A8 
X-CRM114-Status: GOOD (  24.51  )
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

T24gRnJpLCAyNyBNYXkgMjAyMiBhdCAxOTowNCwgRG1pdHJ5IFZ5dWtvdiA8ZHZ5dWtvdkBnb29n
bGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgMjcgTWF5IDIwMjIgYXQgMTY6MDEsIEFsZXhhbmRy
ZSBHaGl0aQo+IDxhbGV4YW5kcmUuZ2hpdGlAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gPiBPbiBG
cmlkYXksIE1heSAyNywgMjAyMiBhdCAzOjU1OjI0IFBNIFVUQysyIERtaXRyeSBWeXVrb3Ygd3Jv
dGU6Cj4gPj4KPiA+PiBPbiBGcmksIDI3IE1heSAyMDIyIGF0IDE1OjUwLCBBbGV4YW5kcmUgR2hp
dGkKPiA+PiA8YWxleGFuZC4uLkBjYW5vbmljYWwuY29tPiB3cm90ZToKPiA+PiA+IE9uIEZyaWRh
eSwgTWF5IDI3LCAyMDIyIGF0IDM6MDI6MDEgUE0gVVRDKzIgRG1pdHJ5IFZ5dWtvdiB3cm90ZToK
PiA+PiA+Pgo+ID4+ID4+IE9uIEZyaSwgMjcgTWF5IDIwMjIgYXQgMTQ6NTUsIHN5emJvdAo+ID4+
ID4+IDxzeXpib3QrMmM1ZGE2Li4uQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+IHdyb3RlOgo+
ID4+ID4+ID4KPiA+PiA+PiA+IEhlbGxvLAo+ID4+ID4+ID4KPiA+PiA+PiA+IHN5emJvdCBmb3Vu
ZCB0aGUgZm9sbG93aW5nIGlzc3VlIG9uOgo+ID4+ID4+ID4KPiA+PiA+PiA+IEhFQUQgY29tbWl0
OiBjOTMyZWRlYWY2ZDYgcmlzY3Y6IGR0czogbWljcm9jaGlwOiBmaXggZ3BpbzEgcmVnIHByb3Bl
cnR5Li4KPiA+PiA+PiA+IGdpdCB0cmVlOiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0IGZpeGVzCj4gPj4gPj4gPiBjb25zb2xlIG91
dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTQxOGFkZDVm
MDAwMDAKPiA+PiA+PiA+IGtlcm5lbCBjb25maWc6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3Qu
Y29tL3gvLmNvbmZpZz94PWFhNmI1NzAyYmRmMTRhMTcKPiA+PiA+PiA+IGRhc2hib2FyZCBsaW5r
OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9MmM1ZGE2YTBhMTZhMGM0
ZjM0YWEKPiA+PiA+PiA+IGNvbXBpbGVyOiByaXNjdjY0LWxpbnV4LWdudS1nY2MgKERlYmlhbiAx
MC4yLjEtNikgMTAuMi4xIDIwMjEwMTEwLCBHTlUgbGQgKEdOVSBCaW51dGlscyBmb3IgRGViaWFu
KSAyLjM1LjIKPiA+PiA+PiA+IHVzZXJzcGFjZSBhcmNoOiByaXNjdjY0Cj4gPj4gPj4gPgo+ID4+
ID4+ID4gSU1QT1JUQU5UOiBpZiB5b3UgZml4IHRoZSBpc3N1ZSwgcGxlYXNlIGFkZCB0aGUgZm9s
bG93aW5nIHRhZyB0byB0aGUgY29tbWl0Ogo+ID4+ID4+ID4gUmVwb3J0ZWQtYnk6IHN5emJvdCsy
YzVkYTYuLi5Ac3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+ID4+ID4+Cj4gPj4gPj4gVGhlIENP
TkZJR19LQVNBTl9WTUFMTE9DIGFsbG93cyByaXNjdiBrZXJuZWwgdG8gYm9vdCwgYnV0IG5vdyBH
bwo+ID4+ID4+IHByb2Nlc3NlcyBzdGFydGVkIGNyYXNoaW5nIHdpdGg6Cj4gPj4gPj4KPiA+PiA+
PiAxOTcwLzAxLzAxIDAwOjA2OjU1IGZ1enplciBzdGFydGVkCj4gPj4gPj4gcnVudGltZTogbGZz
dGFjay5wdXNoIGludmFsaWQgcGFja2luZzogbm9kZT0weGZmZmZmZjU5MDhhOTQwIGNudD0weDEK
PiA+PiA+PiBwYWNrZWQ9MHhmZmZmNTkwOGE5NDAwMDAxIC0+IG5vZGU9MHhmZmZmNTkwOGE5NDAK
PiA+PiA+PiBmYXRhbCBlcnJvcjogbGZzdGFjay5wdXNoCj4gPj4gPj4gcnVudGltZSBzdGFjazoK
PiA+PiA+PiBydW50aW1lLnRocm93KHsweDMwODg0YywgMHhjfSkKPiA+PiA+PiAvdXNyL2xvY2Fs
L2dvL3NyYy9ydW50aW1lL3BhbmljLmdvOjExOTggKzB4NjAKPiA+PiA+PiBydW50aW1lLigqbGZz
dGFjaykucHVzaCgweGRiMzg1MCwgMHhmZmZmZmY1OTA4YTk0MCkKPiA+PiA+PiAvdXNyL2xvY2Fs
L2dvL3NyYy9ydW50aW1lL2xmc3RhY2suZ286MzAgKzB4MWE4Cj4gPj4gPj4KPiA+PiA+PiBHbyBy
dW50aW1lIHRyaWVzIHRvIHNob3ZlIHNvbWUgZGF0YSBpbnRvIHRoZSB1cHBlciAxNiBiaXRzIG9m
IHBvaW50ZXJzCj4gPj4gPj4gYXNzdW1pbmcgdGhleSBhcmUgdW51c2VkLgo+ID4+ID4+IEhvd2V2
ZXIsIHRoZSBvcmlnaW5hbCBwb2ludGVyIG5vZGU9MHhmZmZmZmY1OTA4YTk0MCBzdWdnZXN0IHJp
c2N2IG5vdwo+ID4+ID4+IGhhcyA1Ni1iaXQgdXNlcnMtc3BhY2UgYWRkcmVzcyBzcGFjZT8KPiA+
PiA+Cj4gPj4gPgo+ID4+ID4gWWVzLCBzdjU3IHdhcyBtZXJnZWQgcmVjZW50bHkuCj4gPj4gPgo+
ID4+ID4+Cj4gPj4gPj4gRG9jdW1lbnRhdGlvbi9yaXNjdi92bS1sYXlvdXQucnN0IGNsYWltcyA0
OC1iaXQgcG9pbnRlcnM6Cj4gPj4gPj4gIgo+ID4+ID4+IFRoZSBSSVNDLVYgcHJpdmlsZWdlZCBh
cmNoaXRlY3R1cmUgZG9jdW1lbnQgc3RhdGVzIHRoYXQgdGhlIDY0Yml0IGFkZHJlc3Nlcwo+ID4+
ID4+ICJtdXN0IGhhdmUgYml0cyA2M+KAkzQ4IGFsbCBlcXVhbCB0byBiaXQgNDcsIG9yIGVsc2Ug
YSBwYWdlLWZhdWx0IGV4Y2VwdGlvbiB3aWxsCj4gPj4gPj4gb2NjdXIuIjoKPiA+PiA+Cj4gPj4g
Pgo+ID4+ID4gVGhhbmtzIGZvciBwb2ludGluZyB0aGF0LCBJIGV4dHJhY3RlZCB0aGF0IGZyb20g
dGhlIHNwZWNpZmljYXRpb24gYmVmb3JlIHN2NTcgd2FzIHNwZWNpZmllZCwgSSdsbCBmaXggdGhh
dC4KPiA+PiA+Cj4gPj4gPiBUaGUgY3VycmVudCBrZXJuZWwgY29kZSB3aWxsIHVzZSBzdjU3IGFz
IGl0IGlzIHN1cHBvcnRlZCBhbmQgYWR2ZXJ0aXNlZCBieSBxZW11LCBhbmQgdG8gbXkga25vd2xl
ZGdlLCB5b3UgY2FuJ3QgZG93bmdyYWRlIHRvIHN2NDggdW5sZXNzIGJ5IHJlLWNvbXBpbGluZyBx
ZW11IHVzaW5nIHRoZSBmb2xsb3dpbmc6Cj4gPj4gPgo+ID4+ID4gZGlmZiAtLWdpdCBhL3Rhcmdl
dC9yaXNjdi9jc3IuYyBiL3RhcmdldC9yaXNjdi9jc3IuYwo+ID4+ID4gaW5kZXggNmRiZTliNTQx
Zi4uYTY0YjUwZWQ3NSAxMDA2NDQKPiA+PiA+IC0tLSBhL3RhcmdldC9yaXNjdi9jc3IuYwo+ID4+
ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L2Nzci5jCj4gPj4gPiBAQCAtNjM3LDcgKzYzNyw3IEBAIHN0
YXRpYyBjb25zdCBjaGFyIHZhbGlkX3ZtXzFfMTBfNjRbMTZdID0gewo+ID4+ID4gW1ZNXzFfMTBf
TUJBUkVdID0gMSwKPiA+PiA+IFtWTV8xXzEwX1NWMzldID0gMSwKPiA+PiA+IFtWTV8xXzEwX1NW
NDhdID0gMSwKPiA+PiA+IC0gW1ZNXzFfMTBfU1Y1N10gPSAxCj4gPj4gPiArIFtWTV8xXzEwX1NW
NTddID0gMAo+ID4+ID4gfTsKPiA+PiA+Cj4gPj4gPiAvKiBNYWNoaW5lIEluZm9ybWF0aW9uIFJl
Z2lzdGVycyAqLwo+ID4+ID4KPiA+PiA+PiAuLi4KPiA+PiA+PiAwMDAwMDAwMDAwMDAwMDAwIHwg
MCB8IDAwMDAwMDNmZmZmZmZmZmYgfCAyNTYgR0IgfAo+ID4+ID4+IHVzZXItc3BhY2UgdmlydHVh
bCBtZW1vcnksIGRpZmZlcmVudCBwZXIgbW0KPiA+PiA+PiAiCj4gPj4KPiA+PiBUaGVyZSBpcyBu
byBrZXJuZWwgY29uZmlnIHRvIGZvcmNlIFNWNDgvMzksIHJpZ2h0Pwo+ID4KPiA+Cj4gPiBObywg
d2UgcmVseSBvbiB3aGF0IHRoZSBoYXJkd2FyZSBhZHZlcnRpc2VzLCBpZiBpdCBzdXBwb3J0cyBz
djU3LCB3ZSdsbCBnbyBmb3Igc3Y1NywgaWYgbm90LCB3ZSdsbCB0cnkgc3Y0OC4uLmV0Yy4gSSBo
YWQgc29tZSBwYXRjaGVzIHRvIGZvcmNlIHRoZSBkb3duZ3JhZGUgYnkgdXNpbmcgdGhlIGRldmlj
ZSB0cmVlIGJ1dCB0aGV5IG5ldmVyIGdvdCBtZXJnZWQgdGhvdWdoLgo+Cj4gK29yaWdpbmFsIEND
IGxpc3QKPgo+IEZUUiBzZW50IEdvIHJ1bnRpbWUgY2hhbmdlIHRvIHN1cHBvcnQgU1Y1NzoKPiBo
dHRwczovL2dvLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvZ28vKy80MDkwNTUKCgoKSXMgQ09O
RklHX0NNRExJTkUgYnJva2VuIG9uIHJpc2N2PwpJIGFtIHJ1bm5pbmcgd2l0aDoKCkNPTkZJR19D
TURMSU5FPSJlYXJseXByaW50az1zZXJpYWwgbmV0LmlmbmFtZXM9MApzeXNjdGwua2VybmVsLmh1
bmdfdGFza19hbGxfY3B1X2JhY2t0cmFjZT0xIGltYV9wb2xpY3k9dGNiCm5mLWNvbm50cmFjay1m
dHAucG9ydHM9MjAwMDAgbmYtY29ubnRyYWNrLXRmdHAucG9ydHM9MjAwMDAKbmYtY29ubnRyYWNr
LXNpcC5wb3J0cz0yMDAwMCBuZi1jb25udHJhY2staXJjLnBvcnRzPTIwMDAwCm5mLWNvbm50cmFj
ay1zYW5lLnBvcnRzPTIwMDAwIGJpbmRlci5kZWJ1Z19tYXNrPTAKcmN1cGRhdGUucmN1X2V4cGVk
aXRlZD0xIG5vX2hhc2hfcG9pbnRlcnMgcGFnZV9vd25lcj1vbgpzeXNjdGwudm0ubnJfaHVnZXBh
Z2VzPTQgc3lzY3RsLnZtLm5yX292ZXJjb21taXRfaHVnZXBhZ2VzPTQKc2VjcmV0bWVtLmVuYWJs
ZT0xIHN5c2N0bC5tYXhfcmN1X3N0YWxsX3RvX3BhbmljPTEKbXNyLmFsbG93X3dyaXRlcz1vZmYg
ZHVtbXlfaGNkLm51bT0yIHNtcC5jc2RfbG9ja190aW1lb3V0PTMwMDAwMAp3YXRjaGRvZ190aHJl
c2g9MTY1IHdvcmtxdWV1ZS53YXRjaGRvZ190aHJlc2g9NDIwCnN5c2N0bC5uZXQuY29yZS5uZXRk
ZXZfdW5yZWdpc3Rlcl90aW1lb3V0X3NlY3M9NDIwIHBhbmljX29uX3dhcm49MSIKCkJ1dCBnZXR0
aW5nIEJVR3Mgd2l0aCB0aGUgZGVmYXVsdCB0aW1lb3V0Ogp3YXRjaGRvZzogQlVHOiBzb2Z0IGxv
Y2t1cCAtIENQVSMwIHN0dWNrIGZvciAyM3MhIFtrd29ya2VyLzA6NDoyMDM5XQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
