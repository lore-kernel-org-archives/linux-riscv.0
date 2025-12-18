Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852CFD6E2CA
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 17:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nxteud4DnvJ+XDElbIaU3z/4wpvy3O+qL8NQvCBDHtw=; b=vHhxQVHMA7zgje
	G/yRIihfVmbDJZJg9+dHKqQumIU29m1BIH2K8y8v0YJq7id9I8p7WtQ/wf9mh/K3KnKfKeDIxqJdu
	oLu/w4FhAq5U998vu9xR5b2NWNyjaikTSWxr1l0znW5305XE+rvK+PTpyH215pft5RGrwdKdfLDjI
	TV5oihPIj1NV2X+daNDqvO2QMoPhacro5uV1L8nYcZcsJF44EgO3yywegDISd28+JSKaKEM+gqO1F
	0Kr2+HtFvG09vISdc6NTlOXg56ZGWUjSpPEzeYpZ9I9IsanJ+YAeHx8REJxi+sv9gLn5o5oxupqoT
	UaK/md8AhohWpzMa/ovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIEm-00000008xVq-1uFZ;
	Thu, 18 Dec 2025 17:56:28 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIEi-00000008xUO-0iyd
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 17:56:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso1596295a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 09:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766080582; x=1766685382; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+6WN6/p1fp60hzkSr+llXdbvd+YBmTxfk1iXBMLJZA=;
        b=OAMNaSR5+fXiVt3rQ/qEmP4SqerCNxvRKoeA1cqLpdLZAoRxxi8/7GtSYYuJQmDfBM
         xmx/ODJRD2xUIxsP7JioIK3C2dx4OnDPhh2d71Oiyj9QMv2bIcknlMoInr9awrtXGYU0
         3YDldOpZZGbB8DOtSFolwxWIHmtd8HARV9cxrKyaC9odrCf+DoeZ2j3eyiXsfn1GlBkD
         4erHuQJvEjZmjNz1Ya/eWP3o7KUoJQ9+mm2kCGM6vWyPLttoAtjUk+jtRR/NRXVkoA9R
         6Ui5SWuWuEzGAB81stVVVVL7mJslqWjaAk5lvA7q7UQEdbv6jjGjiFJ7U86G7HUP8qQ9
         AiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080582; x=1766685382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+6WN6/p1fp60hzkSr+llXdbvd+YBmTxfk1iXBMLJZA=;
        b=MV9+N3cvm7D8RQCErbQncmUwEDD2YuGy0rvzmq0ISbNXibGbe5NZDHoaZYpEBO+T57
         pxUtLR2Q9DRGKGX0fjvkQRXUThea3ZpKmMghMXRc3gwu5nK46EV2abs78CZawoRAcKUw
         abGd99TD7jBxjm2QZjEzn7IGsGo7OhoSgqWLsxt2RnkF7PRm/8SOZuNuVoCqMj7WDRJU
         lvaB1xOYyhBoZK27BI7ymK5l9Bhd94nf5qQYH0s0YcYXeLhvEGAe4rKDGsCiKYlhdsWL
         1NRYTsnETw2/8PpNtgVA9avEJu7hwe2MC9t/hQelzDi/uGxHLwJb28o6mXQmGg5/3ZvJ
         MqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwdBrEaT4elBLxlXDpJxdjcF0tSlFoKLBvXs3jcUSFo68in2Xh21nKgOGM0+m5Eo4fYvHqa6OssywiXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPmzlQaUKM1xQi3eizKc5T9TJUg3nI+rdGh3qa3IxSyNht6jaB
	qCTBnxI2hZ/uJ6l+HyaBhHxVoq8d51mQMts/OUkGuxpbyFXi+lWhqCaQk1w/s7GSN0mXpiRyHTo
	rrh4rEafa58pASPuX55gqO1gn4fJp07LTg6IcA7gpbg==
X-Gm-Gg: AY/fxX7VJmEe/AXjVAbo74LOV6wErVGddkmXSZncRHyTISah+2K6yqPwnLkXDu8fo7l
	SOJOnXxA+u+utoZ5S+6Z9ju7CgrljkL5BZ1D2t+22UCNdYMIVJHfY3CN/VcSMEOm2YgiBoUfMiQ
	EuIKjTtiQ0hdGeOyVzv/nQhrksp1Rj7ubwG0zIEnKFJYIvv2sPBtYPkLxeDdVPVY9dvkxtnZhTH
	JPCK30FinWTGxmCef2hzSNPgNi+KJuJMbqvjhXlcplTclDWUCJk3CI/y5C3GRWJfhjSIIaQLAmN
	v/W309dq21n0kS0omiTCFkqR
X-Google-Smtp-Source: AGHT+IFq7ELTQKzF/TRk0SfbylhiIq5ob7abkvIiaiZCwA97lZgHawIVNTbXj5kEfVQ3oQIcBivxjmxKv95IDYu+mh0=
X-Received: by 2002:a05:6402:35c1:b0:649:e5be:1b4e with SMTP id
 4fb4d7f45d1cf-64b8e94d187mr222712a12.9.1766080582211; Thu, 18 Dec 2025
 09:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 12:55:45 -0500
X-Gm-Features: AQt7F2qjqHZAYpNwxuF-SUIUKVwppChumOkUsgRootjGM8dZ2yshNK1pTfmluNo
Message-ID: <CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>, 
	Christophe Leroy <chleroy@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, 
	Nicholas Miehlbradt <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_095624_228856_8791671F 
X-CRM114-Status: GOOD (  20.32  )
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

T24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgMTI6MTDigK9QTSBBbmRyZXcgRG9ubmVsbGFuIDxhamRA
bGludXguaWJtLmNvbT4gd3JvdGU6Cj4KPiBbSSB3aWxsIGJlIGxlYXZpbmcgSUJNIGluIGFib3V0
IGEgbW9udGggZnJvbSBub3csIGFuZCB3aWxsIGFsc28gYmUgb24gbGVhdmUKPiBmb3IgbW9zdCBv
ZiB0aGF0IHRpbWUgc3RhcnRpbmcgdG9tb3Jyb3cuIEkndmUgY2MnZCBteSBwZXJzb25hbCBlbWFp
bCwgd2hpY2gKPiBJIGFtIGdvaW5nIHRvIHVzZSBmb3IgYW55IGtlcm5lbCBkZXZlbG9wbWVudCBJ
IGRvIGFmdGVyIEkgbGVhdmUsIGFuZCBhbHNvCj4gU3Jpc2ggU3Jpbml2YXNhbiwgd2hvIHdpbGwg
YmUgdGFraW5nIG92ZXIgc29tZSBvZiBteSB3b3JrLl0KPgo+IFN1cHBvcnQgcGFnZSB0YWJsZSBj
aGVjayBvbiBQb3dlclBDLiBQYWdlIHRhYmxlIGNoZWNrIHRyYWNrcyB0aGUgdXNhZ2Ugb2YKPiBv
ZiBwYWdlIHRhYmxlIGVudHJpZXMgYXQgZWFjaCBsZXZlbCB0byBlbnN1cmUgdGhhdCBhbm9ueW1v
dXMgbWFwcGluZ3MgaGF2ZQo+IGF0IG1vc3Qgb25lIHdyaXRhYmxlIGNvbnN1bWVyLCBhbmQgbGlr
ZXdpc2UgdGhhdCBmaWxlLWJhY2tlZCBtYXBwaW5ncyBhcmUKPiBub3Qgc2ltdWx0YW5lb3VzbHkg
YWxzbyBhbm9ueW1vdXMgbWFwcGluZ3MuCj4KPiBJbiBvcmRlciB0byBzdXBwb3J0IHRoaXMgaW5m
cmFzdHJ1Y3R1cmUsIGEgbnVtYmVyIG9mIGhlbHBlcnMgb3Igc3R1YnMgbXVzdCBiZQo+IGRlZmlu
ZWQgb3IgdXBkYXRlZCBmb3IgYWxsIHBvd2VycGMgcGxhdGZvcm1zLiBBZGRpdGlvbmFsbHksIHdl
IHNlcGFyYXRlCj4gc2V0X3B0ZV9hdCgpIGFuZCBzZXRfcHRlX2F0X3VuY2hlY2tlZCgpLCB0byBh
bGxvdyBmb3IgaW50ZXJuYWwsIHVuaW5zdHJ1bWVudGVkCj4gbWFwcGluZ3MuCj4KPiBPbiBzb21l
IFBvd2VyUEMgcGxhdGZvcm1zLCBpbXBsZW1lbnRpbmcge3B0ZSxwbWQscHVkfV91c2VyX2FjY2Vz
c2libGVfcGFnZSgpCj4gcmVxdWlyZXMgdGhlIGFkZHJlc3MuIFdlIHJldmVydCBwcmV2aW91cyBj
aGFuZ2VzIHRoYXQgcmVtb3ZlZCB0aGUgYWRkcmVzcwo+IHBhcmFtZXRlciBmcm9tIHZhcmlvdXMg
aW50ZXJmYWNlcywgYW5kIGFkZCBpdCB0byBzb21lIG90aGVyIGludGVyZmFjZXMsCj4gaW4gb3Jk
ZXIgdG8gYWxsb3cgdGhpcy4KPgo+IEZvciBub3csIHdlIGRvbid0IGFsbG93IHBhZ2UgdGFibGUg
Y2hlY2sgYWxvbmdzaWRlIEhVR0VUTEJfUEFHRSwgZHVlIHRvIHRoZQo+IGFyY2gtc3BlY2lmaWMg
Y29tcGxleGl0eSBvZiBzZXRfaHVnZV9wYWdlX2F0KCkuIChJJ20gc3VyZSBJIGNvdWxkIGZpZ3Vy
ZQo+IHRoaXMgb3V0LCBidXQgSSBoYXZlIHRvIGdldCB0aGlzIHZlcnNpb24gb24gdGhpcyBsaXN0
IGJlZm9yZSBJIGxlYXZlIG15IGpvYi4pCj4KPiBUaGlzIHNlcmllcyB3YXMgaW5pdGlhbGx5IHdy
aXR0ZW4gYnkgUm9oYW4gTWNMdXJlLCB3aG8gaGFzIGxlZnQgSUJNIGFuZAo+IGlzIG5vIGxvbmdl
ciB3b3JraW5nIG9uIHBvd2VycGMuCj4KPiB2MTg6Cj4gICogUmViYXNlIG9uIG1tLW5ldwo+ICAq
IEFkZCBpbnN0cnVtZW50YXRpb24gZm9yIHB1ZHBfaW52YWxpZGF0ZSgpCj4gICogQWRkIGNsZWFu
dXAgcGF0Y2ggdG8gdXNlIHB0ZV9hZHZhbmNlX3BmbigpCj4gICogTW92ZSBwe20sdX1kX3VzZXJf
YWNjZXNzaWJsZV9wYWdlKCkgdG8gYSBtb3JlIHNlbnNpYmxlIHBsYWNlIGluIHRoZSBjb2RlCj4g
ICogRGlzYWJsZSB3aGVuIEhVR0VUTEJfUEFHRSBpcyBlbmFibGVkCgpUaGFuayB5b3UuIFRoaXMg
c2VyaWVzIGxvb2tzIGdvb2QgdG8gbWUuCgpQYXNoYQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
