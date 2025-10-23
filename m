Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C7DCCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 19:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4BOrfxGswlUN5mLNhydP7HFKS4z4SVU0QXDuhRyexw=; b=JC48qMO9Ug7jn7
	XncK179daqa5sdLJXHQQHVox6YLGondAkYXInPzEwXjV0Ix2lTX/GbTLPbUeTKKBWDfduKzn5IkX8
	/pwFZtuLcVOtGApjEUUBjznkbFXAPoTqy2i+vvBK3NDY/VPWwVYzXgGtHonvezeMVCke4D54aXOsq
	Iz2sY2ZWqCH2FOZG6YXosct7akyAjoVLLl3alpqJswqbss8/uZD9FovDZULtWgPwr7Cwv+oZz6uqI
	qnktvPfK/PqXT88zo2MpIdtvXBZyJlbzAFZC9xRV+wkVwS7idkxG20kC7MmgPItpbdzTu+xxU/YsL
	Jw8pTJ9sVm2q0B/8J2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC13Z-00000007NUJ-1ss6;
	Thu, 23 Oct 2025 19:33:05 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC13X-00000007NTy-0CIe
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 19:33:04 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-63c523864caso2769994a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 12:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761247981; x=1761852781; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B+nka1o0UKTB6+YPro/AThdj4Pv3gE7VXwEkULP704E=;
        b=duxZ//KRFbctfgKi/2n3f7c7PJ426NBouwIGgMrYTN1gM9sZQ5qMkNMQfF3Lu5dw/u
         LUSrqCFw3DGgUFt2qlqPmaXIbcIole48InHjRw62RyPwOo17tX3UWdCZiEknFanoe/iT
         6aRxmqBb0u2DG726QhrSJsLZxcrbhVg44+c98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761247981; x=1761852781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+nka1o0UKTB6+YPro/AThdj4Pv3gE7VXwEkULP704E=;
        b=ejbZwiZ4SCZWlWhgD3yJgLk3fkQm/3iExwiNG+xjoTThGR6inIoKDVuvKgp35tBmK+
         wiix/Mkgr+O4pxCwnA/4Vz+l6Y5xJRtG9bnagaFe4NcsRM0VNq7ei/ep8irjsV4mbihA
         fjqfgIQgdscZHKgfL7Jqw+CkjjebUKkphP3z+mTBkIpphJJ7sqqJxDZM7OcFZqSkoULt
         SytSmvJmrGQ8TACtgZjgrpgInD+krLfYa6z4VtkXDMBhJ2BKAJ0lSbJb2uFG1G6Pfm4K
         s2AX+Xy7jph7OH5OTiCcXrnrO0TA4GLzGxO/cuENG+q+w+2PZqt20jJvo4mRkl251T4l
         H7wA==
X-Forwarded-Encrypted: i=1; AJvYcCVLRaEMYU5MtpLRXw6/d/MXx3cTtJDndVZbGH8xNj48t07Z3wQKf3sPcLTaVqjJDdYrY0M0Res+ivDoSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoZs/4l83EGUAjFgbtC9hdL1HzhaUop/4FYOIPQG19jZpoubzj
	wigyS3sq+KMjyw1c0J8jF1/xFDHc3T7JpKibk4B784QAFuY7bRw83+IzUYAGPgHqxveBbJ9b3Sk
	VUYx6XwrWvA==
X-Gm-Gg: ASbGnct7jXkselZ3//vvIjWfMDETAB1nSoeUVjRJ2nWKmfjj55/7MaJ6UC6FOE1OIsr
	ICeNTPI530k8oWfSZKjxcBOtxz/41SpySyTnffJpS4fkF29dm1PzAewszVHz/wvz7StgLXqNgWb
	ACa+UTcWzPsC53kbxUcPv00nJC/+4p8B/pkKTb6eRNlrY1zXzE+kL3TTisrr+nFIfscf8EJ4XMr
	q0NIYlNVmBD5Eoxp8NRDwOsjbgJL2WNHiM0C563dKDyJ5pJ5g0kbkjmTW2dgBCOaHw2Pkc+ZapE
	mVgqfTygdapOLAJFiDRGR+OL6plHn8jpOy9TCDopsTObEpDOeuRpdaJ8Of1uTf2brNIaA8jvj+i
	/Ka5tlEr5Z0C21bz5xjZ8x5LgUqbB6dp40ykWILv3aPWJ0VBcRtmMu90ffY3lyk7Xi7VO6sakmY
	N5L5ZG9KZUgE50jHrQdvr/xE5M+XfrRA0jxfQ/QWU6BHrPVwROSw==
X-Google-Smtp-Source: AGHT+IGO/ydgT3+yQIPRdYmKD2HfTPGciRRLztEDu0X9b84h3godHNwGI98+YtEOT9KUDFBxQVWI/w==
X-Received: by 2002:a05:6402:5c8:b0:63c:1170:656a with SMTP id 4fb4d7f45d1cf-63c1f6d6428mr22144093a12.37.1761247981017;
        Thu, 23 Oct 2025 12:33:01 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb2736sm2314309a12.6.2025.10.23.12.32.59
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 12:33:00 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b5c18993b73so218616666b.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 12:32:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBwzSsJNfzlB2BRc0X9eHHpKVDRxuXexlm6sx5eQ/ReN+BPJYA/mjF/s3CJEQaAxfuvLWyScuq1MA7BA==@lists.infradead.org
X-Received: by 2002:a05:6402:2681:b0:634:ba7e:f6c8 with SMTP id
 4fb4d7f45d1cf-63c1f6d5e1bmr24956720a12.34.1761247589536; Thu, 23 Oct 2025
 12:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251022102427.400699796@linutronix.de> <20251022103112.478876605@linutronix.de>
 <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com> <873479xxtu.ffs@tglx>
In-Reply-To: <873479xxtu.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Oct 2025 09:26:12 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
X-Gm-Features: AWmQ_bmaCluDq9_Xyq5CJoakX9a-PwfYiYDMZ1KnC-jDJR9ceAw_ALWfx9Y5hW4
Message-ID: <CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_123303_116447_BF4D13EC 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Oct 2025 at 08:44, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> But as you said out-of-line function call it occured to me that these
> helpers might be just named get/put_user_inline(). Hmm?

Yeah, with a comment that clearly says "you need to have actual
performance numbers for why this needs to be inlined" for people to
use it.

           Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
