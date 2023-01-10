Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9F6C61DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 23:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dg9K3j+Rvo5IsyjyLOzUY5J/FE8s4w1TSJ9XJyjYe3c=; b=b/uTGf22py97Sr
	0KarNuwxAs37fQeu1Ijhv9+TtgytHiEC5P4m1NJ1f3C7cJSk8ZjZCjCSjEUAzujxe3orFTTdH/Uje
	DIvNDh5Snc3LPSO7f3hlqbFgp/hlD7GUfT9Lss0QTe4uoUhdyZcyYxWrsJn9+1aHDHO5PUwzVCHD/
	iACM+ONxt7c+I4G+RBPrvs3uhZKkTDQNyPKgsnzby/qoClVQAbybNDjftNYN5P85yzWgxUUDgI0e+
	U669VyHRm9uVeQEnjTKod2u+PsnHAwgGz/SmKbhfh33i6FZ/IAwcqf2XTH5tAkfx+GUoA4RVxINp8
	Vh+05/+bFjcN92fBLoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFNwX-008tuM-KF; Tue, 10 Jan 2023 23:22:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFNwV-008tsi-34
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 23:22:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id z5so12303132wrt.6
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 15:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmGS/5cqJeFoACOJHc4BZzYIiIrGMVykwhdR9XF4jmk=;
        b=c9g60mip6DpvqJLy5dqRJjsW9pGnhDft8wTL2uY8ndZFa5w6WYCaP0WJwePVMeaSJ0
         t9h2CoV7gylh95IMSaormiIQc3G2EZCrEX+EQUHRe2KDvDhc76MEv0KE+vgy4xE1Jmpp
         PDV1NAP9Xxw5nErDe0nKNAK29nrD9pU7mZfdrVUAl+FEm5S/w1ML7vfEgTAZkUJvSlsK
         jc0C/VDjQqn2ZfnvCbv2Uf/PIl6dXAJtnKrn1SCsPy5wH1l1kojpHDE/BgVWarRWUPJt
         ik1P+2NgbNAnx1J2YAPvMZ9BeFT3wBkUeUxrzk+cS6ZIeKO4OHj3P4tJPh3sqK9Mzb0j
         rTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmGS/5cqJeFoACOJHc4BZzYIiIrGMVykwhdR9XF4jmk=;
        b=ZWvqoo6NWlBbzPKtFq6RaxeXz/fJx39Fsbp0cusx9BCDrUv3hyDeySEjOgjPhRu7UQ
         sr9UVOJW7o6Kf36+RkTuxs2nztAo4QHRDsIrWJ67ea+vyDVPBaMIcwvkxS/EV3qRrxwf
         ZKGd7X6TcZ1o6I9+UDyvDzXA274muSPTEoA77RA1CXNSVRoAumS99YIOZblwGaKktCxQ
         pFbBsvmYxfHdqbc1tlVMj+RbmzN7i1uQ/M5rtRgVcF/n4CznEi+ra7r0JKUb0Ub12TA9
         KVCDL7T48SCZVQgepn7nStTOGH7VoUEju8Yy6KkFluRLHHjP7IojLRxvKiYjQZebIbFt
         qZMg==
X-Gm-Message-State: AFqh2kpLenRCTXGo0HqcK9JHLm8ktR4f4pCuZH92Jw1P0i2vjWkfURsJ
	uP+uVoMJvdJiKrkqZMDGnDGfew==
X-Google-Smtp-Source: AMrXdXuPV2x7LUIyKJ2bgEVRoXBdmp8FuAYdkb702LTqrQdwWYBCkc8H47LxWuVyUOVifyalSD3xIQ==
X-Received: by 2002:adf:de88:0:b0:2bb:e864:7a30 with SMTP id w8-20020adfde88000000b002bbe8647a30mr7331280wrl.32.1673392920931;
        Tue, 10 Jan 2023 15:22:00 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b0028965dc7c6bsm12192345wrp.73.2023.01.10.15.22.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Jan 2023 15:22:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] riscv: elf: add .riscv.attributes parsing
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <6dcdd143-ff1c-41f7-9f46-0c4505575669@rivosinc.com>
Date: Tue, 10 Jan 2023 23:21:59 +0000
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux@rivosinc.com,
 kernel test robot <lkp@intel.com>
Message-Id: <9061941F-3221-467D-B0FC-DCA8E8FF3996@jrtc27.com>
References: <20230110201841.2069353-1-vineetg@rivosinc.com>
 <01AF458D-1EDC-47D1-A902-A686E2DF26AF@jrtc27.com>
 <6dcdd143-ff1c-41f7-9f46-0c4505575669@rivosinc.com>
To: Vineet Gupta <vineetg@rivosinc.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_152207_209851_13A721F3 
X-CRM114-Status: GOOD (  17.63  )
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

T24gMTAgSmFuIDIwMjMsIGF0IDIxOjUwLCBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMu
Y29tPiB3cm90ZToKPiBPbiAxLzEwLzIzIDEyOjQ4LCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPj4g
T24gMTAgSmFuIDIwMjMsIGF0IDIwOjE4LCBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMu
Y29tPiB3cm90ZToKPj4+IFRoaXMgaW1wbGVtZW50cyB0aGUgZWxmIGxvYWRlciBob29rIHRvIHBh
cnNlIFJWIHNwZWNpZmljCj4+PiAucmlzY3YuYXR0cmlidXRlcyBzZWN0aW9uLiBUaGlzIHNlY3Rp
b24gaXMgaW5zZXJ0ZWQgYnkgY29tcGlsZXJzCj4+PiAoZ2NjL2xsdm0pIHdpdGggYnVpbGQgcmVs
YXRlZCBpbmZvcm1hdGlvbiBzdWNoIGFzIC1tYXJjaCBvcmdhbml6ZWQgYXMKPj4+IHRhZy92YWx1
ZSBhdHRyaWJ1dGUgcGFpcnMuCj4+PiAKPj4+IEl0IGlkZW50aWZpZXMgdGhlIHZhcmlvdXMgYXR0
cmlidXRlIHRhZ3MgKGFuZCBjb3JyZXNwb25kaW5nIHZhbHVlcykgYXMKPj4+IGN1cnJlbnRseSBz
cGVjaWZpZWQgaW4gdGhlIHBzQUJJIHNwZWNpZmljYXRpb24uCj4+PiAKPj4+IFRoaXMgcGF0Y2gg
b25seSBpbXBsZW1lbnRzIHRoZSBlbGYgcGFyc2luZyBtZWNoYW5pY3MsIGxlYXZpbmcgb3V0IHRo
ZQo+Pj4gcmVjb3JkaW5nL3VzYWdlIG9mIHRoZSBhdHRyaWJ1dGVzIHRvIHN1YnNlcXVlbnQgcGF0
Y2hlcy4KPj4+IAo+Pj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwu
Y29tPiAgIyBjb2RlIHVuZGVyIENPTkZJR19DT01QQVQKPj4+IFNpZ25lZC1vZmYtYnk6IFZpbmVl
dCBHdXB0YSA8dmluZWV0Z0ByaXZvc2luYy5jb20+Cj4+IFRoaXMgY29kZSBpcyBmdWxsIG9mIGJ1
ZmZlciBvdmVycnVucyBhbmQgdW5pbml0aWFsaXNlZCByZWFkcyBpbiB0aGUKPj4gcHJlc2VuY2Ug
b2YgbWFsaWNpb3VzIGZpbGVzLAo+IAo+IFdoaWxlIHRoZSBvdXRlciBsb29wIGlzIGJvdW5kLCBp
bmRlZWQgdGhlIGludGVybmFsIHBvaW50ZXIgaW5jcmVtZW50cyBjb3VsZCBnZXQgb29iLgo+IEkg
ZG9uJ3QgcmVjYWxsIHNlZWluZyBleGlzdGluZyBleHBsaWNpdCAic2FmZSIgcG9pbnRlciwgc28g
dGhpbmtpbmcgb2YgY29va2luZyBzb21ldGhpbmcgdXAuCj4gVGhlIGNvbmNlcHR1YWwgaWRlYSBp
cyB0byByZXBsYWNlCj4gCj4gICAgIHAgKz0gNAo+IAo+IHdpdGgKPiAKPiAgICBQVFJfSU5DKHAs
IDQsIHBfbWF4KQo+IAo+IEFuZCBzaW1pbGFybHkgcmVwbGFjZQo+IAo+ICAgICB3aGlsZSAoKnAr
KyAhPSAnXDAnKQo+IAo+IHdpdGgKPiAKPiAgICAgd2hpbGUgKCpwICE9ICdcMCcpCj4gICAgICAg
ICAgIFBUUl9JTkMocCwgMSwgcF9tYXgpCj4gCj4gSXMgdGhhdCBzdWZmaWNpZW50IG9yIHlvdSBo
YWQgc29tZXRoaW5nIGVsc2UgaW4gbWluZC4KCknigJlkIGJlIHZlcnkgY2FyZWZ1bCBhYm91dCBv
YmZ1c2NhdGluZyBjb250cm9sIGZsb3cgYnV0IGhvdyB5b3UKaW1wbGVtZW50IGl0IGlzIGJldHdl
ZW4geW91IGFuZCBvdGhlciBrZXJuZWwgZGV2ZWxvcGVycywgd2hpY2ggSSBkb27igJl0CmNvdW50
IG15c2VsZiBhcy4KCj4+IGFuZCBmYWlscyB0byBjaGVjayB0aGUgdmVyc2lvbiwgdmVuZG9yIGFu
ZCBzdWItc3Vic2VjdGlvbiB0YWcuCj4gCj4gVGhhdCBpcyBub3cgYWRkZWQuCj4gCj4+IFlvdSBh
bHNvIHNob3VsZCBoYW5kbGUgbW9yZSB0aGFuIG9uZSBzdWItc3Vic2VjdGlvbiBldmVuIGlmIHRv
b2xzIGRvbuKAmXQKPj4gZW1pdCBpdCB0b2RheS4KPiAKPiBKdXN0IHRvIGJlIG9uIHNhbWUgcGFn
ZSwgYSBzdWItc2VjdGlvbiBpbXBsaWVzIHRoZSBmb2xsb3dpbmcKPiAKPiAgICAgICB1aW50MzI6
bGVuLCBOVEJTOnZlbmRvci1uYW1lLCB1aW50ODogVGFnX2ZpbGUsIHVpbnQzMjpkYXRhLWxlbiwg
PHRhZz48dmFsdWU+Li4uLgo+IAo+IElmIHNvLCB0aGUgY29kZSBkb2VzIHN1cHBvcnQgbXVsdGlw
bGUgb2YgdGhlc2UKClRoYXTigJlzIGEgc3ViLXNlY3Rpb24sIGJ1dCBJIHNhaWQgc3ViLXN1YnNl
Y3Rpb24uCgpKZXNzCgo+PiBZb3UgYWxzbyBoYXZlIGFuIHVuYWxpZ25lZCBhY2Nlc3MgZm9yIHJl
YWRpbmcgdGhlIHN1Yi1zdWJzZWN0aW9u4oCZcyBkYXRhCj4+IGxlbmd0aCAobWF5YmUgdGhhdOKA
mXMgb2sgaW4ga2VybmVsIGxhbmQsIGJ1dCB3b3J0aCBtYWtpbmcgc3VyZSkuCj4gCj4gVHJ1ZSwg
SSd2ZSBhZGRlZCBnZXRfdW5hbGlnbmVkX2xlMzIgZm9yIHRob3NlIG5vdwo+IAo+IFRoeCwKPiAt
VmluZWV0CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
