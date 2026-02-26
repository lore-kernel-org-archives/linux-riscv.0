Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B707FCE074
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6LQnxOXV7ZBFX8y/yf+biX8/jQDfFw+nz7NFjG6jzk=; b=zfC92HpR7IEgtv
	fadSawtbM341oBlYBv/f/ENbq2oHUS6NPdynvmWc4FsSNRfHH/jOwOaeacBI4vUBkg/EpmUQv07hf
	paHUpWq+kdHCv05Z74dAu8azEWtWpV5+cZQpyOnZeitQhliJxA7vsNQoEZP8NLjvraSw+FHtNYycD
	pvaDbcGYwKCWNa7WGvSAzd/QnxJuZcpsuB7kVh/1nOD6jHEJ3Lf+vc+MnbGKyg5hr0+dpxMqLeK6D
	4XJBnxm2vQcIdyARe6J1HjL4iwdD26oSxoROm1MuPPvozGtIaJHLNIUYk3ronWjo9SFi2CVufYunA
	SN8JIkXJff2amQu90q7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb2E-00000006AFw-3S7v;
	Thu, 26 Feb 2026 13:04:06 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb2C-00000006AFE-2CMZ
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 13:04:05 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-89577f866d6so8439446d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 05:04:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772111043; cv=none;
        d=google.com; s=arc-20240605;
        b=BQO66wA6gUSF/OV95K63loyQnu6/BB5L2iEu37M9TKr8IL30G2yaP5IgW5u/Quid72
         Ml+/D5cDsnkxjDjNTCv9LLyznE0XACysILgrOWKChwk7g2W9t7on9QGCc5QMbWEq3rZS
         BBP4dTkjAa2mZrvkH1Uwrd5mehiCV0R92ufKnW9yzJf0j3ZT7hzv/nlrtDilMTbGImsa
         XT5UGnv3i+ZNKyVQaBAUK6mnEqnoFaCWpQJUrncxTbaZhplQtrcTnLYDYIxDelp5VbrM
         /jqgtHmjhyQnFwLWNUP9lkMv2naPwvCBLD2VahJEgXxp1A5/DVqIn5HxBZjB22luf07p
         jjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mwjWT74ZELvW876QVLVh+669mSdTJGGgo8QMDlsj5zg=;
        fh=HLhWgTwFzOO7LeV9R9S52V0GshYYDlKTTE4unwA5eJg=;
        b=AKiVhlj1khoPIGGoQAMkmYo5HCB9cwsweC1RKVw2mUO7c1r37ti6WZewUnSCuygJPq
         Z+nT7YJLT5Ceocr0HY8eYQfsdbC+Pe8OfmT3TCVNoaMFacxuQpX91fY5GzPaI/u0B1GG
         OSHVrJsiYteQC5DFEEleTnpaARXzVKkt+gLquyzaa6/UoqoFCb1C7/5l28lSFbhW+9Q4
         ny7F1D0yt6rdw36u/Tb9XAk3hqwNO0IRKi+1IW+TILhHZl4CCnEdpGjiITIYON9fgVIG
         pknx25BVhGAZBkEhs7wtZymrtOJHJwdmUEyaUs8OiSQAdkCmYKYVZUjYZt4PKMjizu3W
         BsPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772111043; x=1772715843; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwjWT74ZELvW876QVLVh+669mSdTJGGgo8QMDlsj5zg=;
        b=oUICgZX8I9bMInBHdxVBK6smdv3vvm5WlXRce0Yute80GEu/TMo4kAXIoHvRjPmQtR
         MbVOz6+Bpw33e7gC/Q++CXkTxs/c9nByTQqpWTJIUJ+OY06oY5+AKVe1C/ayT8NF4kMm
         nhr3M4XJl5+rZVc6CEbLb1gG+H8EZRD9xhDNudPJtjPU4IxBX83cT/Djv5ldiVdRInBw
         n/dnM9NXCuLVZ0LIH/U1x2NumMzgGZ3ZrH2k3sQuBAVUrfyanS1WzS+CanH63FpGIuEY
         uiXrR1WpbjlKZ37nk5eUqsrY9wh5TZlRntTZMVW8hWbihgQXTJyFyAekywUcnMTkmTkR
         ujKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772111043; x=1772715843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwjWT74ZELvW876QVLVh+669mSdTJGGgo8QMDlsj5zg=;
        b=MEEce+nsyIF3IGcFHkPxz7Mz5sfRU+3aSRLaFsbQbAvq9u6rA1bszk6xjlYAihGK0t
         IXS4L+dgDKr/RMW8D2Cx7GfVd9SMnn9pj9SJl6cHvoe90yu0jbdKsBME8VYzgEUgQpMO
         Nkx6H1vaCx4izmaXDWzzjL9lH+uOOLcOZ5RO29S9TLg4jJMdS4wozsEQmCOHyU6dgSUy
         KPACYStXMU3exZmnPrnHf/dSdB8/DIuGnvZ1KIVqnIHUcblspWsjOyK55RBMx87HDyhN
         yCCXKQNYEy+mLc+H6TwexIqGZVqjIxCsXTdMofHy+sIEQ1NOjQWrBjMZevfQwdLeKxF5
         ky/g==
X-Forwarded-Encrypted: i=1; AJvYcCWOOPkkwrCIYeJ4ZwkDh1T2gZQPXYZ5I75SsTcqKM1UxGxE2bjeYSEUA/j5SGx+fAdzCtx7Sn+U9l57dQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGE6vHCaHMWM2CqfHZWR1tb0N6kEGfDtPB24NvL6YNeCTkPp58
	UCGjH2jDeJWwVF/ZEqvwjBlX+SMuc718gqIHETgKPmB+nA3jAU1bdov2DgzGUX70DoBF/d/HOsQ
	Nyg0HZH62z9KQUD39ZJrhCdGu6odjmE0/FQzR+BIyIBuYAlc9oLMJnn0BlQ==
X-Gm-Gg: ATEYQzytA0bkgoogW0HDGqWJDmVQZOuAKVPY2j3NV26VdBejr2heSqW9hWQdFsekj3K
	iuI23od2KWCFfMN4+YaBE08fV/p8QSk0JfDB9Q+vLOrFykWDRc4g4JERNjq4lqj6FeBAAiFD0d7
	SSqWtkQ2FH9jsHvhH7C2mUW9sk5a0Z3IEbunM7o5o3QgEq7O42Vxq8xFsf41/5lh1CzSmyjiivp
	zLspjAEYvVH4dnKn4/PmNcpjdHL/JUOxkqmEepxGKn2QBuck3ICeCl5jugbi0tvj0wlPL4r2BAy
	eqbf2NJsmnMn8Iz5WXNWQbIPsFT/VLC36kn4/eHkUw34BiTaaQ6Ljed0WCmoiot6l0w4TPeB92d
	QyPnJbJ+u6Dmdy6Lr7iVxiAIbiA==
X-Received: by 2002:a05:6214:d47:b0:899:b181:1396 with SMTP id
 6a1803df08f44-899c67f203bmr34639236d6.21.1772111042977; Thu, 26 Feb 2026
 05:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260223-mouth-plated-50294c7a6ac0@wendy> <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
 <20260224-likewise-rimless-151f6a12b092@wendy> <CA+Ht8=Z-iaQ+zys5UOy6iNtdTsdtjq7mARwz=KJA_vbNYcfF6w@mail.gmail.com>
 <20260225-compress-moody-400a1e2f46fb@spud> <CAAhSdy2WHLahqPMTCqoSff6Z3no8sX2j_g858jp4XW5Et4dJXw@mail.gmail.com>
 <20260226-shifty-stingily-acfd81c08fde@spud> <CAK9=C2VmEWyPuvGLKhuU+Uew_x2nrj-CMuf_4=5UmNvFMb55qw@mail.gmail.com>
 <D6694466-B57D-4B62-8E70-34B09A2B77DD@kernel.org>
In-Reply-To: <D6694466-B57D-4B62-8E70-34B09A2B77DD@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Feb 2026 18:33:51 +0530
X-Gm-Features: AaiRm52-dvsGSNjRtMYzpPEJ0uq7etgHSQUXzH0QwjIv5AnuYjwXuec-NnzdDno
Message-ID: <CAAhSdy0gCfeaFyh-M5MWxPDk8XWsi_qHrVd85mOD0UxaHVBJuQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_050404_709687_56A62A0B 
X-CRM114-Status: GOOD (  27.73  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgNjowNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gMjYgRmVicnVhcnkgMjAyNiAxMTo0MDo1MSBHTVQs
IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+T24gVGh1LCBG
ZWIgMjYsIDIwMjYgYXQgMjoxNOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPj4KPiA+PiBPbiBUaHUsIEZlYiAyNiwgMjAyNiBhdCAxMTowNToxNEFNICswNTMw
LCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4+ID4gT24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgMjozMeKA
r1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4gPiA+Cj4gPj4g
PiA+IE9uIFdlZCwgRmViIDI1LCAyMDI2IGF0IDEwOjMzOjI3QU0gKzA1MzAsIEhpbWFuc2h1IENo
YXVoYW4gd3JvdGU6Cj4gPj4gPiA+ID4gT24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgMTozM+KAr1BN
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+ID4+ID4g
PiA+ID4KPiA+PiA+ID4gPiA+IE9uIFR1ZSwgRmViIDI0LCAyMDI2IGF0IDA5OjMwOjI0QU0gKzA1
MzAsIEhpbWFuc2h1IENoYXVoYW4gd3JvdGU6Cj4gPj4gPiA+ID4gPiA+IEhpLAo+ID4+ID4gPiA+
ID4gPgo+ID4+ID4gPiA+ID4gPiBPbiBNb24sIEZlYiAyMywgMjAyNiBhdCAzOjU14oCvUE0gQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gPj4gPiA+ID4g
PiA+ID4KPiA+PiA+ID4gPiA+ID4gPiBPbiBNb24sIEZlYiAyMywgMjAyNiBhdCAxMDoxOToxN0FN
ICswNTMwLCBIaW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+ID4+ID4gPgo+ID4+ID4gPiA+ID4KPiA+
PiA+ID4gPiA+IERpZCB5b3UgbWlzcyB0aGUgY29tbWVudCBhdCB0aGUgZW5kIGFib3V0IHRoZSBy
ZW1haW5pbmcgVE9ET3M/Cj4gPj4gPiA+ID4KPiA+PiA+ID4gPiBOby4gQXMgSSBtZW50aW9uZWQg
aW4gdGhlIGNvdmVyIGxldHRlciwgdGhlIHB0cmFjZSBzdXBwb3J0IGlzIG5vdAo+ID4+ID4gPiA+
IGltcGxlbWVudGVkIGhlcmUuIEkgYW0gYWN0aXZlbHkgd29ya2luZyBvbiBpdCBhbmQgdGhlc2Ug
YXJlCj4gPj4gPiA+ID4gaW1wbGVtZW50ZWQgaW4gcHRyYWNlIHdvcmsuCj4gPj4gPiA+ID4gVGhl
IHRlc3QgaXMgZG9uZSB1c2luZyB0aGUgcGVyZiBldmVudHMgZGlyZWN0bHkuIFRoZSBzZWNvbmQg
cGF0Y2ggaW4KPiA+PiA+ID4gPiB0aGlzIHBhdGNoIHNldCBoYXMgdGhlIHRlc3QgYXBwbGljYXRp
b24uCj4gPj4gPiA+Cj4gPj4gPiA+IFRoZW4gdGhlIHBhdGNoc2V0IHNob3VsZCBzdGlsbCBiZSBt
YXJrZWQgUkZDLCBzaW5jZSBpdCBpcyBub3QgZmluaXNoZWQuCj4gPj4gPgo+ID4+ID4gV293ISBs
ZXQncyBhbGwgb2YgdXMgcG9zdCBvbmx5IGxhcmdlIHNlcmllcyAoY292ZXJpbmcgbXVsdGlwbGUg
ZmVhdHVyZXMpCj4gPj4gPiB3aGljaCBhcmUgZGlmZmljdWx0IHRvIHJldmlldyBpbnN0ZWFkIG9m
IG1ha2luZyBsaWZlIGVhc2llciBmb3IgcmV2aWV3ZXJzCj4gPj4gPiB0aHJvdWdoIGluY3JlbWVu
dGFsIHNlcmllcyB3aGljaCBtYWtlIGdyYWR1YWwgcHJvZ3Jlc3Mgb3Zlci10aW1lLgo+ID4+Cj4g
Pj4gV2hlcmUgZGlkIEkgc2F5IGRvbid0IHBvc3QgaXQ/IEluIGZhY3QsIG1hcmtpbmcgaXQgUkZD
ICpyZXF1aXJlcyoKPiA+PiBwb3N0aW5nIGl0LiBEb24ndCBwdXQgd29yZHMgaW4gbXkgbW91dGgu
Cj4gPj4KPiA+Cj4gPldlbGwsIEkgZGlzYWdyZWUgd2l0aCB5b3Ugc3VnZ2VzdGlvbiBvZiBtYXJr
aW5nIHRoaXMgc2VyaWVzIGFzIFJGQy4KPiA+VGhpcyBzZXJpZXMgaGFzIHdlbGwgZGVmaW5lZCBz
Y29wZSBhbmQgaXMgYmFzZWQgb24gcmF0aWZpZWQgc3BlYy4KPiA+QSBzZXJpZXMgbmVlZCBub3Qg
Y292ZXIgYWxsIHBvc3NpYmxlIGZlYXR1cmVzIHRvIGJlIGEgcmVndWxhcgo+ID5ub24tUkZDIHBh
dGNoZXMuCj4gPgo+ID5Eb24ndCB0aHJvdyB5b3VyIFJGQyByZWxhdGVkIG9waW5pb25zIHBvaW50
bGVzc2x5Lgo+Cj4gSXQncyBjbGVhcmx5IG5vdCBwb2ludGxlc3Mgd2hlbiB0aGVyZSBhcmUgdW5l
eHBsYWluZWQgVE9ET3MuCj4gU2VlaW5nIHRvLWRvIGl0ZW1zIGlzIGFic29sdXRlbHkgc3VmZmlj
aWVudCBncm91bmRzIHRvIHF1ZXN0aW9uIHRoZW0sIGFuZCB3aGVuIHRoZSByZXNwb25zZSBkb2Vz
bid0IGNsZWFybHkgZXhwbGFpbiB3aHkgdGhleSdyZSBva2F5LCBteSB0aG91Z2h0cyBhYm91dCBS
RkMgYXJlIHJlYXNvbmFibGUgLSBldmVuIGlmIHVsdGltYXRlbHkgdGhleSBtaWdodCBiZSBpbmNv
cnJlY3QuCgpUcmVhdGluZyBzZXJpZXMgUkZDIGp1c3QgYmVjYXVzZSB0aGVyZSBpcyBzb21lIGZ1
dHVyZSB3b3JrIHRvIGJlIGRvbmUKaXMgY2xlYXJseSBhIHBvaW50bGVzcyBvcGluaW9uIG9mIHlv
dXJzLgpQZW9wbGUgYWNyb3NzIGtlcm5lbCBzdWJzeXN0ZW0gZGV2ZWxvcCBmZWF0dXJlcyBpbmNy
ZW1lbnRhbGx5IGFzCm11bHRpcGxlIHNlcmllcy4KCj4gSW5zdGVhZCBvZiBiZWluZyBwYXNzaXZl
IGFnZ3Jlc3NpdmUgd2l0aCBtZSwgeW91IGNvdWxkIGhhdmUganVzdCBleHBsYWluZWQgd2h5IGl0
IHdhcyBva2F5LgoKWW91IHN0YXJ0ZWQgdGhlIGFncmVzc2lvbiBieSBhc2tpbmcgdGhlIHNlcmll
cyB0byBiZSBSRkMganVzdCBiYXNlZCBvbgp5b3VyIG9waW5pb24uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
